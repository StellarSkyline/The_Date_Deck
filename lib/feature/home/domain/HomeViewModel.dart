import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:date_deck/feature/home/data/model/date.dart';
import 'package:date_deck/feature/home/data/repo/HomeRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import '../../../feature/home/data/database/date_dao.dart';

class HomeViewModel extends ChangeNotifier {

  //Repo injection
  late HomeRepository _homeRepo;
  
  HomeViewModel({required HomeRepository homeRepo}) {
    _homeRepo = homeRepo;
    init();
  }
  
  //State
  late DateDao _dao;

  final CardSwiperController _controller = CardSwiperController();

  CardSwiperController get controller => _controller;

  int _categoryIndex = 0;

  int get categoryIndex => _categoryIndex;

  late Date _dateIdea;

  get dateIdea => _dateIdea;

  //Constructor

  //Methods
  void init() async {
    _dao = await _homeRepo.buildDatabase();

    notifyListeners();
  }

  void setDateIdea(Date date) {
    _dateIdea = date;
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
        return _homeRepo.getActiveDates();
      case 1:
        return _homeRepo.getCreativeDates();
      case 2:
        return _homeRepo.getGamesDates();
      case 3:
        return _homeRepo.getCookingDates();
      default:
        return _homeRepo.getActiveDates();
    }
  }

  Future<bool> saveDate() {
    //generate data
    var generatedId = Random().nextInt(9999);
    //build request body
    final Map<String, dynamic> requestBody = {
      "Category": _dateIdea.category.displayName,
      "Effort Value": _dateIdea.effortValue,
      "Name": _dateIdea.name,
      "Suit": _dateIdea.suit.name,
      "id": generatedId
    };

    //encode request body
    final body = jsonEncode(requestBody);
    return _homeRepo.postDate(body, _dateIdea.category);
  }
}
