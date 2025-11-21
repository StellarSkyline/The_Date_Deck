import 'dart:async';

import 'package:date_deck/feature/home/data/model/date.dart';
import 'package:date_deck/feature/home/data/repo/HomeRepository.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_svg/svg.dart';

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

  get graphics => _graphics;

  final _cardNumbers = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K'];

  get cardNumbers => _cardNumbers;

  get suitGraphics => _suitGraphics;


  //Graphics Logic
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

  final _suitGraphics = [
    {'suit': SvgPicture.asset('assets/icons/icn_club.svg', fit: BoxFit.fill), 'color': Colors.black},
    {'suit': SvgPicture.asset('assets/icons/icn_spade.svg', fit: BoxFit.fill), 'color': Colors.black},
    {'suit': SvgPicture.asset('assets/icons/icn_heart.svg', fit: BoxFit.fill), 'color': Color(0xFFE06F7C)},
    {'suit': SvgPicture.asset('assets/icons/icn_diamond.svg', fit: BoxFit.fill), 'color': Color(0xFFE06F7C)},
  ];


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
    if(savedDate == null) _dao.insertDate(date);
  }

  Future<List<Date>> getFavorites() {
    return _dao.getAllDates();
  }

  Future<bool> checkDate(int id) async {
    final savedDate = await _dao.findById(id);
    if(savedDate == null) {
      return true;
    } else {
      return false;
    }
  }

  //Network Methods
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
