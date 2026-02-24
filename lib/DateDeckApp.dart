import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';

import 'feature/home/data/database/database.dart';
import 'feature/home/data/database/date_dao.dart';
import 'firebase_options.dart';

class DateDeckApp {
  //Init App Dependencies

  //Database Initialization
  static Future<DateDao> buildDatabase() async {
    final database = await $FloorAppDatabase.databaseBuilder('flutter_database.db').build();
    return database.dateDao;
  }

  //Firebase Init
  static Future<void> initFirebaseAuth() async {
    await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  }
}
