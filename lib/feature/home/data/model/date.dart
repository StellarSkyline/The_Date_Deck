import 'package:floor/floor.dart';

import 'category.dart';
import 'suit.dart';


@entity
class Date {
  @primaryKey
  final int id;

  final String name;

  final Category category;

  final Suit suit;

  final int effortValue;


  Date ({required this.id, required this.name, required this.category, required this.suit, required this.effortValue});

  factory Date.fromJson(Map<String, dynamic> json) {
    return Date(
      id: json['id'] as int,
      name: json['Name'] as String,
      category: Category.values.byName(json['Category']),
      suit: Suit.values.byName(json['Suit']),
      effortValue: json['Effort Value'],
    );
  }
}

