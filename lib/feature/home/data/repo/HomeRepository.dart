import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;

import '../../core/Constants.dart';
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
    //model uri
    final uri = Uri.https(baseUrl,'/$category.json');
    //response
    final response = await http.get(uri);

    try{
      final List<Date> dates = (jsonDecode(response.body) as List<dynamic>).map((e) => Date.fromJson(e)).toList();
      dates.shuffle();
      return dates;
   } catch(e) {
      throw Exception(e);
    }
  }

  Future<List<Date>> getActiveDates() => getDates('active');
  Future<List<Date>> getCookingDates() => getDates('cooking');
  Future<List<Date>> getCreativeDates() => getDates('creative');
  Future<List<Date>> getGamesDates() => getDates('games');
}
