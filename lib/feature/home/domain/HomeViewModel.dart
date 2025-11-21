import 'dart:async';
import 'dart:convert';

import 'package:date_deck/feature/home/core/database/Constants.dart';
import 'package:date_deck/feature/home/data/model/date.dart';
import 'package:date_deck/feature/home/data/repo/HomeRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

import '../../../feature/home/core/database/date_dao.dart';
import '../data/model/category.dart';

class HomeViewModel extends ChangeNotifier {
  //Repo
  final _HomeRepo = HomeRepository();

  //State
  late DateDao _dao;

  final CardSwiperController _controller = CardSwiperController();

  CardSwiperController get controller => _controller;

  int _categoryIndex = 0;

  int get categoryIndex => _categoryIndex;


  //Graphics Logic
  //Replace img_default with illustrations
  final _graphics = [
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

  get graphics => _graphics;

  final _cardNumbers = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K'];

  get cardNumbers => _cardNumbers;

  final _suitGraphics = [
    {'suit': SvgPicture.asset('assets/icons/icn_club.svg', fit: BoxFit.fill), 'color': Colors.black},
    {'suit': SvgPicture.asset('assets/icons/icn_spade.svg', fit: BoxFit.fill), 'color': Colors.black},
    {'suit': SvgPicture.asset('assets/icons/icn_heart.svg', fit: BoxFit.fill), 'color': Color(0xFFE06F7C)},
    {'suit': SvgPicture.asset('assets/icons/icn_diamond.svg', fit: BoxFit.fill), 'color': Color(0xFFE06F7C)},
  ];

  get suitGraphics => _suitGraphics;

  //Constructor
  HomeViewModel() {
    init();
  }

  //Methods
  void init() async {
    _dao = await _HomeRepo.buildDatabase();
    notifyListeners();
  }

  void setCategoryIndex(int index) {
    _categoryIndex = index;
    notifyListeners();
  }

  void deleteDate(Date date) {
    _dao.deleteDate(date);
    notifyListeners();
  }

  void insertDate(Date date) {
    _dao.insertDate(date);
    notifyListeners();
  }

  Future<List<Date>> getFavorites() {
    return _dao.getAllDates();
  }

  Future<List<Date>> getCategory(int index) {
    switch(index) {
      case 0: return _HomeRepo.getActiveDates();
      case 1: return _HomeRepo.getCreativeDates();
      case 2: return _HomeRepo.getGamesDates();
      case 3: return _HomeRepo.getCookingDates();
      default: return _HomeRepo.getActiveDates();
    }
  }



}
