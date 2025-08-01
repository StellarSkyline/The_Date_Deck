import 'package:date_deck/feature/home/data/repo/HomeRepository.dart';
import 'package:flutter/cupertino.dart';

import '../../../feature/home/core/database/date_dao.dart';

class HomeViewModel extends ChangeNotifier {

  final _HomeRepo = HomeRepository();

  //State
  late DateDao _dao;
  DateDao get dao => _dao;
  
  //Constructor
  HomeViewModel() {
    init();
  }


//Methods
  Future<void> init() async {
    _dao = await _HomeRepo.buildDatabase();
    notifyListeners();
  }

}