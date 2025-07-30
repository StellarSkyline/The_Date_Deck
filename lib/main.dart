import 'package:date_deck/core/database/category.dart';
import 'package:date_deck/core/database/date.dart';

import 'core/database/database.dart';
import 'core/database/date_dao.dart';
import 'core/database/suit.dart';
import 'feature/home/presentation/screen/HomeScreen.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
    WidgetsFlutterBinding.ensureInitialized();

    final database = await $FloorAppDatabase.databaseBuilder('flutter_database.db').build();

    final dateDao = database.dateDao;

    final dateCount = await dateDao.getTotalDateCount();

    if ( dateCount == 0) {
        final testDate = Date(2, "testDate", "A Date used for Testing", Category.games, Suit.spade);
        await dateDao.insertDate(testDate);
    }


    runApp(MyApp(dateDao));
}

class MyApp extends StatelessWidget {
    final DateDao dao;

    const MyApp(this.dao, {super.key});

    // This widget is the root of your application.
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
            ),
            home: HomeScreen(dao: dao)
        );
    }
}

