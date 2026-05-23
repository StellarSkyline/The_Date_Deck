import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/date.dart';
import '../data/repo/HomeRepository.dart';

class HomeState {
  final bool isLoading;

  HomeState({this.isLoading = false});

  HomeState copyWith({bool? isLoading}) {
    return HomeState(isLoading: isLoading ?? this.isLoading);
  }
}

class HomeViewModel extends Cubit<HomeState> {
  final HomeRepository homeRepo;

  HomeViewModel({required this.homeRepo}) : super(HomeState());

  Future<void> refreshAllDates() async {
    emit(state.copyWith(isLoading: true));
    await homeRepo.clearDatabase();
    List<Date> dates = await homeRepo.getAllDates();
    dates.shuffle();
    for (var date in dates) {
      await homeRepo.insertDate(date);
    }
    emit(state.copyWith(isLoading: false));
  }
}
