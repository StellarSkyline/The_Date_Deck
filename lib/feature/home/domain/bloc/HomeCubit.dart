import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/database/date_dao.dart';
import '../../data/model/date.dart';
import '../../data/repo/HomeRepository.dart';
import 'HomeState.dart';

class HomeCubit extends Cubit<HomeState> {
  //Repo injection
  late DateDao _dao;
  final HomeRepository homeRepo;

  //Constructor and Home Repo injection
  HomeCubit({required this.homeRepo}) : super(HomeState()) {
    init();
  }


  void init() async {
    _dao = await homeRepo.buildDatabase();
    getCategory();
  }

  //Update State Events
  void setDateIdea(Date date) => emit(state.copyWith(dateIdea: date));

  void setCategoryIndex(int index) => emit(state.copyWith(categoryIndex: index));

  //Database Methods
  void deleteDate(Date date) {
    _dao.deleteDate(date);
  }

  void insertDate(Date date) async {
    //Verify if the date exits
    final savedDate = await _dao.findById(date.id);
    if (savedDate == null) _dao.insertDate(date);
  }

  Future<List<Date>> getFavorites() {
    return _dao.getAllDates();
  }

  void getCategory() async {
    final index = state.categoryIndex;
    emit(state.copyWith(isLoading: true));

    switch (index) {
      case 0:
        await homeRepo.getActiveDates().then((dates) => emit(state.copyWith(dateList: dates, isLoading: false)));
      case 1:
        await homeRepo.getCreativeDates().then((dates) => emit(state.copyWith(dateList: dates, isLoading: false)));
      case 2:
        await homeRepo.getGamesDates().then((dates) => emit(state.copyWith(dateList: dates, isLoading: false)));
      case 3:
        await homeRepo.getCookingDates().then((dates) => emit(state.copyWith(dateList: dates, isLoading: false)));
    }
  }
}
