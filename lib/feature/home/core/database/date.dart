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

  Date ({required this.id, required this.shortName, required this.fullDescription, required this.category, required this.suit,});

  factory Date.fromJson(Map<String, dynamic> json) {
    return Date(
      id: json['id'] as int,
      shortName: 'emptystring',//: json[''] as String,
      fullDescription: json['Name'] as String,
      category: json['Category'] as Category,
      suit: json['Card Suit'] as Suit,

    );
  }
}