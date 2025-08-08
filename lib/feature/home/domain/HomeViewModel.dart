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
            }
        );
        notifyListeners();
    }

    void changeStreamDataFavorites() {
        dao.getAllByCategoryAsStream(Category.Active).then((data) {
                data.shuffle();
                _initialShuffleDate = data;
            }
        );

        dao.getFavorites().then((data) {
                _streamControllerFavorites.sink.add(data);
                _initialFavoritesDate = data;
            }
        );
        notifyListeners();
    }

}
