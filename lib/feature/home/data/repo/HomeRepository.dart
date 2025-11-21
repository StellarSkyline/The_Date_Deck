import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:http/http.dart' as http;

import '../../core/database/Constants.dart';
import '../../core/database/database.dart';
import '../../core/database/date_dao.dart';
import '../model/date.dart';

class HomeRepository {
  Future<DateDao> buildDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    final database = await $FloorAppDatabase.databaseBuilder('flutter_database.db').build();

    final dateDao = database.dateDao;

    final String response = await rootBundle.loadString('assets/json/date_idea_database.json');

    final data = (jsonDecode(response) as List).cast<Map<String, dynamic>>();

    data.map<Date>((json) => Date.fromJson(json)).toList().forEach((element) async {
      dateDao.findById(element.id).then((value) async {
        if (value == null) {
          await dateDao.insertDate(element);
        }
      });
    });
    return dateDao;
  }

  Future<List<Date>> getDates(String category) async {
    //get response
    final response = await http.get(Uri.parse('$baseUrl/$category.json'));
    if (response.statusCode == 200) {
      final List<dynamic> decodedJson = jsonDecode(response.body);
      final List<Date> dates = decodedJson.map((e) => Date.fromJson(e)).toList();

      dates.shuffle();

      return dates;
    } else {
      throw Exception('Failed to load data');
    }
  }

  Future<List<Date>> getActiveDates() => getDates('active');

  Future<List<Date>> getCookingDates() => getDates('cooking');

  Future<List<Date>> getCreativeDates() => getDates('creative');

  Future<List<Date>> getGamesDates() => getDates('games');
}
