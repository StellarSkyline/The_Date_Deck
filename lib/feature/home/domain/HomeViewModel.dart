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
    initShuffle();
    initFavorites();
    notifyListeners();
  }

  void initShuffle() async {
    _initialShuffleDate = await _dao.getAllByCategoryAsStream(Category.Active);
    _initialShuffleDate.shuffle();
  }

  void setCategoryIndex(int index) {
    _categoryIndex = index;
    notifyListeners();
  }

  Future<void> setInitialShuffleDate(Category category) async {
    _initialShuffleDate = await _dao.getAllByCategoryAsStream(category);
    notifyListeners();
  }

  void initFavorites() async {
    _initialFavoritesDate = await _dao.getFavorites();
  }

  void updateDate(Date date) {
    _dao.updateDate(date);
    notifyListeners();
  }

  void changeStreamDataCategory(Category category) {
    _dao.getAllByCategoryAsStream(category).then((data) {
      data.shuffle();
      _streamControllerShuffle.sink.add(data);
      _initialShuffleDate = data;
    });
    notifyListeners();
  }

  void changeStreamDataFavorites() {
    _dao.getAllByCategoryAsStream(Category.values[_categoryIndex]).then((data) {
      data.shuffle();
      _initialShuffleDate = data;
    });

    _dao.getFavorites().then((data) {
      _streamControllerFavorites.sink.add(data);
      _initialFavoritesDate = data;
    });
    notifyListeners();
  }
}
