import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../data/model/date.dart';
import 'date_dao.dart';
import '../../data/model/category.dart';
import '../../data/model/suit.dart';



part 'database.g.dart';

@Database(version: 2, entities: [Date])
abstract class AppDatabase extends FloorDatabase {
  DateDao get dateDao;
}

/*
Run script in terminal to generate floor data
dart run build_runner build
* */


