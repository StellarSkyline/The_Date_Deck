
import 'package:flutter/cupertino.dart';
import '../../../feature/home/core/database/category.dart';
import '../../../feature/home/core/database/database.dart';
import '../../../feature/home/core/database/date.dart';
import '../../../feature/home/core/database/date_dao.dart';
import '../../../feature/home/core/database/suit.dart';

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
