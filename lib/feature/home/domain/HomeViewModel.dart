import 'package:date_deck/feature/home/data/model/date.dart';
import 'package:date_deck/feature/home/data/repo/HomeRepository.dart';
import 'package:flutter/cupertino.dart';

import '../../../feature/home/core/database/date_dao.dart';
import '../data/model/category.dart';

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

  void refresh(Category category) {
    notifyListeners();
    print(category);
  }

  Stream<List<Date>> getCategoryAndUpdate(Category category) {
    notifyListeners();
    return dao.getAllByCategoryAsStream(category);
  }
  
  

}