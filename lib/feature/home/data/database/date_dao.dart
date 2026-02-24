import 'package:floor/floor.dart';

import '../../data/model/date.dart';

@dao
abstract class DateDao {
  @insert
  Future<void> insertDate(Date date);

  @update
  Future<void> updateDate(Date date);

  @delete
  Future<void> deleteDate(Date date);

  // get all (future)
  @Query('SELECT * FROM Date')
  Future<List<Date>> getAllDates();

  // find by ID (future)
  @Query('SELECT * FROM Date WHERE id = :id')
  Future<Date?> findById(int id);

  @Query('SELECT DISTINCT(id) FROM Date')
  Stream<int?> getTotalDateCount();
}