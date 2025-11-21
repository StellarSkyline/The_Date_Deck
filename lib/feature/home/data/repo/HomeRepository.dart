import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../core/database/Constants.dart';
import '../../core/database/database.dart';
import '../../core/database/date_dao.dart';
import '../model/date.dart';

class HomeRepository {
  //Database Initalization
  Future<DateDao> buildDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    final database = await $FloorAppDatabase.databaseBuilder('flutter_database.db').build();

    return database.dateDao;
  }

  //Network Calls
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
