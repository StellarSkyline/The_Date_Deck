import 'package:flutter/cupertino.dart';

import '../../data/model/date.dart';

class FavoriteState{
  final bool isEmpty;
  final List<Widget> graphicsList;
  final List<Map<String, Object>> suitList;
  final List<String> cardNumber;
  final List<Date> favoriteList;

  FavoriteState({
    this.isEmpty = true,
    this.graphicsList = const [],
    this.suitList = const [],
    this.cardNumber = const [],
    this.favoriteList = const []
  });

  FavoriteState copyWith({
    bool? isEmpty,
    List<Widget>? graphicsList,
    List<Map<String, Object>>? suitList,
    List<String>? cardNumber,
    List<Date>? favoriteList,
  }) {
    return FavoriteState(
      isEmpty: isEmpty ?? this.isEmpty,
      graphicsList: graphicsList ?? this.graphicsList,
      suitList: suitList ?? this.suitList,
      cardNumber: cardNumber ?? this.cardNumber,
      favoriteList: favoriteList ?? this.favoriteList,
    );
  }
}