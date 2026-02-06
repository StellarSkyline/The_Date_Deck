import 'dart:convert';
import 'package:date_deck/feature/home/data/network/NetworkClient.dart';
import 'package:date_deck/feature/home/data/model/category.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../data/database/database.dart';
import '../../data/database/date_dao.dart';
import '../model/date.dart';

class HomeRepository {
  //Network Helper injection
  final NetworkClient _networkClient;
  HomeRepository({required NetworkClient networkClient}): _networkClient = networkClient;

  //Database Initialization
  Future<DateDao> buildDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    final database = await $FloorAppDatabase.databaseBuilder('flutter_database.db').build();
    return database.dateDao;
  }

  //Network Calls
  Future<List<Date>> getDates(String category) async {
    final response = await _networkClient.get(category);
    final List<Date> dates = (jsonDecode(response.body) as List<dynamic>)
        .map((e) => Date.fromJson(e))
        .toList();
    dates.shuffle();
    return dates;
  }

  Future<bool> postDate(String body, Category category) async {
    //get the length of the current database list needed for patching data on network
    var length = (await getDates(category.displayName.toLowerCase())).length;
    final response = await _networkClient.patch(
      body,
      category.displayName.toLowerCase(),
      length.toString(),
    );
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<Date>> getActiveDates() => getDates('active');

  Future<List<Date>> getCookingDates() => getDates('cooking');

  Future<List<Date>> getCreativeDates() => getDates('creative');

  Future<List<Date>> getGamesDates() => getDates('games');
}
