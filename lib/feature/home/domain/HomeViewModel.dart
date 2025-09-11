import 'dart:async';

import 'package:date_deck/feature/home/data/model/date.dart';
import 'package:date_deck/feature/home/data/repo/HomeRepository.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:flutter_svg/svg.dart';

import '../../../feature/home/core/database/date_dao.dart';
import '../data/model/category.dart';

class HomeViewModel extends ChangeNotifier {
  //Repo
  final _HomeRepo = HomeRepository();

  //State
  late DateDao _dao;

  DateDao get dao => _dao;

  final CardSwiperController _controller = CardSwiperController();

  CardSwiperController get controller => _controller;

  int _categoryIndex = 0;

  int get categoryIndex => _categoryIndex;

  List<Date> _initialShuffleDate = List.empty();

  List<Date> get initialShuffleDate => _initialShuffleDate;

  List<Date> _initialFavoritesDate = List.empty();

  List<Date> get initialFavoritesDate => _initialFavoritesDate;

  final StreamController<List<Date>> _streamControllerShuffle = StreamController<List<Date>>.broadcast();

  StreamController<List<Date>> get streamControllerShuffle => _streamControllerShuffle;

  final StreamController<List<Date>> _streamControllerFavorites = StreamController<List<Date>>.broadcast();

  StreamController<List<Date>> get streamControllerFavorites => _streamControllerFavorites;

  //Graphics Logic
  //Replace img_default with illustrations
  final _graphics = [
    Image.asset('assets/images/img_ace.png', fit: BoxFit.cover),
    Image.asset('assets/images/img_2.png', fit: BoxFit.contain),
     Image.asset('assets/images/img_default.png'),
     Image.asset('assets/images/img_default.png'),
     Image.asset('assets/images/img_default.png'),
     Image.asset('assets/images/img_default.png'),
     Image.asset('assets/images/img_default.png'),
     Image.asset('assets/images/img_default.png'),
     Image.asset('assets/images/img_default.png'),
     Image.asset('assets/images/img_default.png'),
     Image.asset('assets/images/img_default.png'),
     Image.asset('assets/images/img_default.png'),
     Image.asset('assets/images/img_default.png'),
  ];
  get graphics => _graphics;

  final _cardNumbers = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K'];
  get cardNumbers => _cardNumbers;

  final _suitGraphics = [
    {'suit': SvgPicture.asset('assets/icons/icn_club.svg', fit: BoxFit.fill), 'color': Colors.black},
    {'suit': SvgPicture.asset('assets/icons/icn_spade.svg', fit: BoxFit.fill), 'color': Colors.black},
    {'suit':SvgPicture.asset('assets/icons/icn_heart.svg', fit: BoxFit.fill), 'color':Color(0xFFE06F7C)},
    {'suit':SvgPicture.asset('assets/icons/icn_diamond.svg', fit: BoxFit.fill), 'color':Color(0xFFE06F7C)}
  ];
  get suitGraphics => _suitGraphics;

  //Constructor
  HomeViewModel() {
    init();
  }

  //Methods
  Future<void> init() async {
    _dao = await _HomeRepo.buildDatabase();
    initShuffle();
    initFavorites();
    notifyListeners();
  }

  Future<void> initShuffle() async {
    _initialShuffleDate = await dao.getAllByCategoryAsStream(Category.Active);
    _initialShuffleDate.shuffle();
  }

  void setCategoryIndex(int index) {
    _categoryIndex = index;
    notifyListeners();
  }

  Future<void> setInitialShuffleDate(Category category) async {
    _initialShuffleDate = await dao.getAllByCategoryAsStream(category);
    notifyListeners();
  }

  Future<void> initFavorites() async {
    _initialFavoritesDate = await dao.getFavorites();
  }

  void updateDate(Date date) {
    dao.updateDate(date);
    notifyListeners();
  }

  void changeStreamDataCategory(Category category) {
    dao.getAllByCategoryAsStream(category).then((data) {
      data.shuffle();
      _streamControllerShuffle.sink.add(data);
      _initialShuffleDate = data;
    });
    notifyListeners();
  }

  void changeStreamDataFavorites() {
    dao.getAllByCategoryAsStream(Category.values[_categoryIndex]).then((data) {
      data.shuffle();
      _initialShuffleDate = data;
    });

    dao.getFavorites().then((data) {
      _streamControllerFavorites.sink.add(data);
      _initialFavoritesDate = data;
    });
    notifyListeners();
  }
}
