import 'dart:async';
import 'package:floor/floor.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

import 'date.dart';
import 'date_dao.dart';
import 'suit.dart';
import 'category.dart';


part 'database.g.dart';

@Database(version: 1, entities: [Date])
abstract class AppDatabase extends FloorDatabase {
  DateDao get dateDao;
}


