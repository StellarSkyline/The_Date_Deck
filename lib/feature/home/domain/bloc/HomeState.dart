import 'package:date_deck/feature/home/data/model/date.dart';
import 'package:flutter/cupertino.dart';

class HomeState {
  final bool isLoading;
  Date? dateIdea;
  final List<Date> dateList;
  final int categoryIndex;
  final List<Widget> graphicsList;
  final List<Map<String, Object>> suitList;
  final List<String> cardNumber;
  final List<Date> favoriteList;

  HomeState({
    this.isLoading = true,
    this.dateList = const [],
    this.categoryIndex = 0,
    this.graphicsList = const [],
    this.suitList = const [],
    this.cardNumber = const [],
    this.favoriteList = const []
  });

  HomeState copyWith({
    bool? isLoading,
    Date? dateIdea,
    List<Date>? dateList,
    int? categoryIndex,
    List<Widget>? graphicsList,
    List<Map<String, Object>>? suitList,
    List<String>? cardNumber,
    List<Date>? favoriteList,
  }) {
    return HomeState(
      isLoading: isLoading ?? this.isLoading,
      dateList: dateList ?? this.dateList,
      categoryIndex: categoryIndex ?? this.categoryIndex,
      graphicsList: graphicsList ?? this.graphicsList,
      suitList: suitList ?? this.suitList,
      cardNumber: cardNumber ?? this.cardNumber,
      favoriteList: favoriteList ?? this.favoriteList,
    );
  }
}
