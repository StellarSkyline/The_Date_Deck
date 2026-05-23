import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/date.dart';
import '../data/repo/HomeRepository.dart';

class LoginState {
  final bool isLoading;

  LoginState({this.isLoading = false});

  LoginState copyWith({bool? isLoading}) {
    return LoginState(isLoading: isLoading ?? this.isLoading);
  }
}

class LoginViewModel extends Cubit<LoginState> {
  final HomeRepository homeRepo;

  LoginViewModel({required this.homeRepo}) : super(LoginState());

  Future<void> getAllDates() async {
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
