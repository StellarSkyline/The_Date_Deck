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

    final allDates = await dateDao.getAllDates();

    if ( allDates.isEmpty ) {
        final testDate = Date(id: 2, shortName: "testDate", fullDescription: "A Date used for Testing", category: Category.games, suit: Suit.spade);
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

