import 'package:floor/floor.dart';

import '../../data/model/category.dart';
import '../../data/model/date.dart';

@dao
abstract class DateDao {
  // get all (stream)
  @Query('SELECT * FROM Date')
  Stream<List<Date>> getAllDatesAsStream();

  // get all (future)
  @Query('SELECT * FROM Date')
  Future<List<Date>> getAllDates();

  // get favorites (stream)
  @Query('SELECT * FROM Date WHERE favorite = 1')
  Future<List<Date>> getFavorites();

  // find by ID (stream)
  @Query('SELECT * FROM Date WHERE id = :id')
  Stream<Date?> findByIdAsStream(int id);

  // find by ID (future)
  @Query('SELECT * FROM Date WHERE id = :id')
  Future<Date?> findById(int id);

  // get by Category (stream)
  @Query('SELECT * FROM Date WHERE category = :category')
  Future<List<Date>> getAllByCategoryAsStream(Category category);


  @Query('SELECT DISTINCT(id) FROM Date')
  Stream<int?> getTotalDateCount();

  @insert
  Future<void> insertDate(Date date);

  @update
  Future<void> updateDate(Date date);
}