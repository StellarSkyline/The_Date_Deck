import 'package:date_deck/feature/home/data/repo/HomeRepository.dart';
import 'package:flutter/cupertino.dart';

import '../../../feature/home/core/database/date_dao.dart';
import '../data/model/date_idea.dart';

class HomeViewModel extends ChangeNotifier {
  //Repo
  final _HomeRepo = HomeRepository();

  //State
  late DateDao _dao;
  DateDao get dao => _dao;

  List<DateIdea> _test = List.empty();
  List<DateIdea> get test => _test;

  //Constructor
  HomeViewModel() {
    init();
  }

  //Methods
  Future<void> init() async {
    _dao = await _HomeRepo.buildDatabase();
    _test = await _HomeRepo.parseJson();
    notifyListeners();
  }

}