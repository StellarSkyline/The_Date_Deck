import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/date.dart';
import '../data/repo/HomeRepository.dart';

class FavoriteState {
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
    this.favoriteList = const [],
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

class FavoriteViewModel extends Cubit<FavoriteState> {
  final HomeRepository homeRepo;

  //Constructor and Home Repo injection
  FavoriteViewModel({required this.homeRepo}) : super(FavoriteState());

  void getFavorites() async {
    emit(state.copyWith(isEmpty: true));
    final favorites = await homeRepo.getAllFavoriteDates();
    emit(state.copyWith(favoriteList: favorites, isEmpty: false));
  }

  void removeFavorite(Date date) {
    date.favorite = 0;
    homeRepo.updateDate(date);
    getFavorites();
  }
}
