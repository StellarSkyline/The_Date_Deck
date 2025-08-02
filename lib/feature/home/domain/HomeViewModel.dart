import 'dart:async';

import 'package:date_deck/feature/home/data/model/date.dart';
import 'package:date_deck/feature/home/data/repo/HomeRepository.dart';
import 'package:flutter/cupertino.dart';

import '../../../feature/home/core/database/date_dao.dart';
import '../data/model/category.dart';

class HomeViewModel extends ChangeNotifier {
  //Repo
  final _HomeRepo = HomeRepository();

  //State
  late DateDao _dao;
  DateDao get dao => _dao;

  List<Date> _initialDates = List.empty();
  List<Date> get initialDates => _initialDates;

  final StreamController<List<Date>> _streamController = StreamController<List<Date>>.broadcast();
  StreamController<List<Date>> get streamController => _streamController;


  //Constructor
  HomeViewModel() {
    init();
  }

//Methods
  Future<void> init() async {
    _dao = await _HomeRepo.buildDatabase();
    _initialDates = await dao.getAllByCategoryAsStream(Category.Active);
    _initialDates.shuffle();
    notifyListeners();
  }

  void changeStreamData(Category category)  {
    dao.getAllByCategoryAsStream(category).then((data) {
      data.shuffle();
      _streamController.sink.add(data);
    });
    notifyListeners();
  }

  Future<void> initShuffle() async {
    _initialDates = await dao.getAllByCategoryAsStream(Category.Active);
    _initialDates.shuffle();
    notifyListeners();
  }


}