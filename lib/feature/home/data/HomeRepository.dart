import 'package:date_deck/core/database/date_dao.dart';
import 'package:flutter/cupertino.dart';

import '../../../core/database/category.dart';
import '../../../core/database/database.dart';
import '../../../core/database/date.dart';
import '../../../core/database/suit.dart';

class HomeRepository {

  Future<DateDao> buildDatabase() async {
    WidgetsFlutterBinding.ensureInitialized();
    final database = await $FloorAppDatabase.databaseBuilder('flutter_database.db').build();

    final dateDao = database.dateDao;

    final allDates = await dateDao.getAllDates();

    if (allDates.isEmpty) {
      final testDate = Date(2, "testDate", "A Date used for Testing", Category.games, Suit.spade);
      await dateDao.insertDate(testDate);
    }

    return dateDao;

  }

}