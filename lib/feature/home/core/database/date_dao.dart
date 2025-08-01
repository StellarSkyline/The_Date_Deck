import 'package:floor/floor.dart';

import '../../data/model/date.dart';

@dao
abstract class DateDao {
  // get all
  @Query('SELECT * FROM Date')
  Future<List<Date>> getAllDates();

  @Query('SELECT * FROM Date')
  Stream<List<Date>> getAllDatesAsStream();

  @Query('SELECT TOP 10 * FROM Date')
  Future<List<Date>> getTopDates();

  // get favorites
  @Query('SELECT * FROM Date WHERE favorite = 1')
  Stream<List<Date>> getFavorites();

  // find by ID
  @Query('SELECT * FROM Date WHERE id = :id')
  Stream<Date?> findDateByIdAsStream(int id);

  // find by ID
  @Query('SELECT * FROM Date WHERE id = :id')
  Future<Date?> findDateById(int id);

  @Query('SELECT DISTINCT(id) FROM Date')
  Stream<int?> getTotalDateCount();

  @insert
  Future<void> insertDate(Date date);
}