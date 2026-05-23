import 'package:floor/floor.dart';

import '../../data/model/date.dart';

@dao
abstract class DateDao {
  @Insert(onConflict: OnConflictStrategy.replace)
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

  //find date by category
  @Query('SELECT * FROM Date WHERE category = :category')
  Future<List<Date>> findByCategory(int category);

  //insert favorite
  @update
  Future<void> updateFavorite(Date date);

  //Get All Favorite Dates
  @Query('SELECT * FROM Date WHERE favorite = 1')
  Future<List<Date>> getAllFavoriteDates();

  //Clear Table
  @Query('DELETE FROM Date')
  Future<void> clearTable();

  @Query('SELECT DISTINCT(id) FROM Date')
  Stream<int?> getTotalDateCount();
}