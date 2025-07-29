import 'package:floor/floor.dart';

import 'date.dart';

@dao
abstract class DateDao {
  @Query('SELECT TOP 10 * FROM Date')
  Future<List<Date>> findAllDates();


  // find favorites
  @Query('SELECT * FROM Date WHERE favorite = 1')
  Stream<List<Date>> getFavorites();

  @insert
  Future<void> insertDate(Date data);
}