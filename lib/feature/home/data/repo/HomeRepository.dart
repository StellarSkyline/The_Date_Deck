import 'dart:convert';
import 'dart:ffi';
import 'dart:math';

import 'package:date_deck/feature/home/data/model/category.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

import '../../core/Constants.dart';
import '../../core/database/database.dart';
import '../../core/database/date_dao.dart';
import '../model/date.dart';

class HomeRepository {
  //Database Initialization
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

  Future<bool> postDate(String body, Category category) async {

    //get the length of the current database list
    var length = (await getDates(category.displayName.toLowerCase())).length;
    final uri = Uri.https(baseUrl,'/${category.displayName.toLowerCase()}/$length.json');

    final response = await http.patch(
        uri,
        body: body
    );

    if(response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<List<Date>> getActiveDates() => getDates('active');
  Future<List<Date>> getCookingDates() => getDates('cooking');
  Future<List<Date>> getCreativeDates() => getDates('creative');
  Future<List<Date>> getGamesDates() => getDates('games');


  //Graphics Assets
  final graphicsList = [
    Image.asset('assets/images/img_1.png', fit: BoxFit.contain),
    Image.asset('assets/images/img_2.png', fit: BoxFit.contain),
    Image.asset('assets/images/img_3.png', fit: BoxFit.contain),
    Image.asset('assets/images/img_4.png', fit: BoxFit.contain),
    Image.asset('assets/images/img_5.png', fit: BoxFit.contain),
    Image.asset('assets/images/img_6.png', fit: BoxFit.contain),
    Image.asset('assets/images/img_7.png', fit: BoxFit.contain),
    Image.asset('assets/images/img_8.png', fit: BoxFit.contain),
    Image.asset('assets/images/img_9.png', fit: BoxFit.contain),
    Image.asset('assets/images/img_10.png', fit: BoxFit.contain),
    Image.asset('assets/images/img_11.png', fit: BoxFit.contain),
    Image.asset('assets/images/img_12.png', fit: BoxFit.contain),
    Image.asset('assets/images/img_13.png', fit: BoxFit.contain),
  ];

  final suitList = [
    {'suit': SvgPicture.asset('assets/icons/icn_club.svg', fit: BoxFit.fill), 'color': Colors.black},
    {'suit': SvgPicture.asset('assets/icons/icn_spade.svg', fit: BoxFit.fill), 'color': Colors.black},
    {'suit': SvgPicture.asset('assets/icons/icn_heart.svg', fit: BoxFit.fill), 'color': Color(0xFFE06F7C)},
    {'suit': SvgPicture.asset('assets/icons/icn_diamond.svg', fit: BoxFit.fill), 'color': Color(0xFFE06F7C)},
  ];

  final cardNumber = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K'];

}
