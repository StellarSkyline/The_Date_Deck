import 'package:date_deck/feature/home/data/HomeRepository.dart';
import 'package:flutter/cupertino.dart';

import '../../../feature/home/core/database/date_dao.dart';

class HomeViewModel extends ChangeNotifier {
  late DateDao _dao;
  DateDao get dao => _dao;

  final _HomeRepo = HomeRepository();

  String test() {
    return "Im called from the VM";
  }

  Future<void> init() async {
    _dao = await _HomeRepo.buildDatabase();
    notifyListeners();
  }

}