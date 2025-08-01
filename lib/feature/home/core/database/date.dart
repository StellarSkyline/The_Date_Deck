import 'package:floor/floor.dart';

import 'category.dart';
import 'suit.dart';

@entity
class Date {
  @primaryKey
  final int id;

  final String shortName;

  final String fullDescription;

  final Category category;

  final Suit suit;

  bool favorite = false;

  Date(this.id, this.shortName, this.fullDescription, this.category, this.suit);
}