import 'dart:async';

import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import '../../data/model/date.dart';
import '../model/category.dart';
import '../model/suit.dart';
import 'date_dao.dart';

part 'database.g.dart';

@Database(version: 3, entities: [Date])
abstract class AppDatabase extends FloorDatabase {
  DateDao get dateDao;
}

/*
Run script in terminal to generate floor data
dart run build_runner build
* */


