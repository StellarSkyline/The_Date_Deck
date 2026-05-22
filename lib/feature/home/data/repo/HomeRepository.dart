import 'dart:convert';

import 'package:date_deck/feature/home/data/network/NetworkClient.dart';

import '../../data/database/date_dao.dart';
import '../model/date.dart';

class HomeRepository {
  //Network Helper injection
  final NetworkClient _networkClient;
  final DateDao dao;

  HomeRepository({required NetworkClient networkClient, required this.dao}) : _networkClient = networkClient;

  //Database calls
  Future<void> insertDate(Date date) async {
    await dao.insertDate(date);
  }

  Future<void> clearDatabase() async {
    await dao.clearTable();
  }

  Future<List<Date>> getDatesByCategory(int category) async {
    List<Date> dates = await dao.findByCategory(category);
    dates.shuffle();
    return dates;
  }

  Future<List<Date>> getAllDates() async {
    return getDates('dates');
  }

  Future<void> updateDate(Date date) async {
    await dao.updateFavorite(date);
  }

  Future<List<Date>> getAllFavoriteDates() async {
    return dao.getAllFavoriteDates();
  }

  void deleteDate(Date date) {
    dao.deleteDate(date);
  }

  Future<List<Date>> getActiveDates() => getDatesByCategory(0);

  Future<List<Date>> getCookingDates() => getDatesByCategory(1);

  Future<List<Date>> getCreativeDates() => getDatesByCategory(2);

  Future<List<Date>> getGamesDates() => getDatesByCategory(3);

  //Network Calls
  Future<List<Date>> getDates(String category) async {
    final response = await _networkClient.get(category);
    final List<Date> dates = (jsonDecode(response.body) as List<dynamic>).map((e) => Date.fromJson(e)).toList();
    dates.shuffle();
    return dates;
  }

  Future<bool> postDate(String body) async {
    //get the length of the current database list needed for patching data on network
    var length = (await getDates('dates')).length;
    final response = await _networkClient.patch(body, 'dates', length.toString());
    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
