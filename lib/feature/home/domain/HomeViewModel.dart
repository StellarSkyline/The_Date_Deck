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

    List<Date> _initialShuffleDate = List.empty();
    List<Date> get initialSuffhleDate => _initialShuffleDate;

    List<Date> _initialFavoritesDate = List.empty();
    List<Date> get initialFavoritesDate => _initialFavoritesDate;

    final StreamController<List<Date>> _streamController = StreamController<List<Date>>.broadcast();
    StreamController<List<Date>> get streamController => _streamController;

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

    Future<void> initFavorites() async {
      //add init here

    }

    void changeStreamDataCategory(Category category) {
        dao.getAllByCategoryAsStream(category).then((data) {
                data.shuffle();
                _streamController.sink.add(data);
            }
        );
        notifyListeners();
    }

    void changeStreamDataFavorites() {
      // add update stream data here

        notifyListeners();
    }

}
