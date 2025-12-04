import 'dart:async';
import 'dart:convert';
import 'dart:math';

import 'package:date_deck/feature/home/data/model/date.dart';
import 'package:date_deck/feature/home/data/repo/HomeRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import '../../../feature/home/core/database/date_dao.dart';

class HomeViewModel extends ChangeNotifier {
  //Repo
  final _HomeRepo = HomeRepository();

  //State
  late DateDao _dao;

  final CardSwiperController _controller = CardSwiperController();

  CardSwiperController get controller => _controller;

  int _categoryIndex = 0;

  int get categoryIndex => _categoryIndex;

  get graphics => _HomeRepo.graphicsList;

  get cardNumbers => _HomeRepo.cardNumber;

  get suitGraphics => _HomeRepo.suitList;

  //Constructor
  HomeViewModel() {
    init();
  }

  //Methods
  void init() async {
    _dao = await _HomeRepo.buildDatabase();
    notifyListeners();
  }

  //UI Methods
  void setCategoryIndex(int index) {
    _categoryIndex = index;
    notifyListeners();
  }

  //Database Methods
  void deleteDate(Date date) {
    _dao.deleteDate(date);
    notifyListeners();
  }

  void insertDate(Date date) async {
    //Verify if the date exits
    final savedDate = await _dao.findById(date.id);
    if (savedDate == null) _dao.insertDate(date);
  }

  Future<List<Date>> getFavorites() {
    return _dao.getAllDates();
  }

  //Network Methods
  Future<List<Date>> getCategory(int index) {
    switch (index) {
      case 0:
        return _HomeRepo.getActiveDates();
      case 1:
        return _HomeRepo.getCreativeDates();
      case 2:
        return _HomeRepo.getGamesDates();
      case 3:
        return _HomeRepo.getCookingDates();
      default:
        return _HomeRepo.getActiveDates();
    }
  }

  void setDate(Date date) {
    //generate data
    var generatedId = Random().nextInt(9999);
    final Map<String, dynamic> requestBody = {
      "Category": date.category.displayName,
      "Effort Value": date.effortValue,
      "Name": date.fullDescription,
      "Suit": date.suit.name,
      "id": generatedId
    };

    final body = jsonEncode(requestBody);
    _HomeRepo.postDate(body, date.category);
  }
}
