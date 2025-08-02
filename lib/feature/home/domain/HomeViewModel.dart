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

  final StreamController<List<Date>> _streamController = StreamController<List<Date>>();
  StreamController<List<Date>> get streamController => _streamController;


  //Constructor
  HomeViewModel() {
    init();
  }

//Methods
  Future<void> init() async {
    _dao = await _HomeRepo.buildDatabase();
    notifyListeners();
  }

  void changeStreamData(Category category)  {
    dao.getAllByCategoryAsStream(category).then((data) {
      _streamController.sink.add(data);
    });
    notifyListeners();
  }

}