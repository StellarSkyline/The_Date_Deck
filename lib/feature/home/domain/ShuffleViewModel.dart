import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/date.dart';
import '../data/repo/HomeRepository.dart';
class ShuffleState {
  final bool isLoading;
  final List<Date> dateList;
  final int categoryIndex;
  final List<Widget> graphicsList;
  final List<Map<String, Object>> suitList;
  final List<String> cardNumber;

  ShuffleState({
    this.isLoading = true,
    this.dateList = const [],
    this.categoryIndex = 0,
    this.graphicsList = const [],
    this.suitList = const [],
    this.cardNumber = const [],
  });

  ShuffleState copyWith({
    bool? isLoading,
    Date? dateIdea,
    List<Date>? dateList,
    int? categoryIndex,
    List<Widget>? graphicsList,
    List<Map<String, Object>>? suitList,
    List<String>? cardNumber,
    List<Date>? favoriteList,
  }) {
    return ShuffleState(
      isLoading: isLoading ?? this.isLoading,
      dateList: dateList ?? this.dateList,
      categoryIndex: categoryIndex ?? this.categoryIndex,
      graphicsList: graphicsList ?? this.graphicsList,
      suitList: suitList ?? this.suitList,
      cardNumber: cardNumber ?? this.cardNumber,
    );
  }
}


class ShuffleViewModel extends Cubit<ShuffleState> {
  //Repo injection
  final HomeRepository homeRepo;

  //Constructor and Home Repo injection
  ShuffleViewModel({required this.homeRepo}) : super(ShuffleState()) {
    init();
  }

  void init() async {
    getCategory();
  }

  //Update State Events
  void setCategoryIndex(int index) => emit(state.copyWith(categoryIndex: index));

  //Update Date to add Favorite
  void updateDate(Date date) {
    date.favorite = 1;
    homeRepo.updateDate(date);
  }

  void getCategory() async {
    final index = state.categoryIndex;
    emit(state.copyWith(isLoading: true));

    switch (index) {
      case 0:
        await homeRepo.getActiveDates().then(
          (dates) => emit(state.copyWith(dateList: dates, isLoading: false)),
        );
      case 1:
        await homeRepo.getCreativeDates().then(
          (dates) => emit(state.copyWith(dateList: dates, isLoading: false)),
        );
      case 2:
        await homeRepo.getGamesDates().then(
          (dates) => emit(state.copyWith(dateList: dates, isLoading: false)),
        );
      case 3:
        await homeRepo.getCookingDates().then(
          (dates) => emit(state.copyWith(dateList: dates, isLoading: false)),
        );
    }
  }
}
