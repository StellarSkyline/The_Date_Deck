import 'package:date_deck/feature/home/domain/bloc/FavoriteState.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/database/date_dao.dart';
import '../../data/model/date.dart';
import '../../data/repo/HomeRepository.dart';

class FavoriteViewModel extends Cubit<FavoriteState>{

  late DateDao _dao;
  final HomeRepository homeRepo;

  //constructor
//Constructor and Home Repo injection
  FavoriteViewModel({required this.homeRepo}) : super(FavoriteState()) {
    init();
  }

  void init() async {
    _dao = await homeRepo.buildDatabase();
  }

  void deleteDate(Date date) {
    _dao.deleteDate(date);
  }

  void getFavorites() async  {
    emit(state.copyWith(isEmpty: true));
    final favorites =  await _dao.getAllDates();
    emit(state.copyWith(favoriteList: favorites, isEmpty: false));
  }

}