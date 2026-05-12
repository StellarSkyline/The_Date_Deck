import 'package:flutter_bloc/flutter_bloc.dart';

import '../../login/AuthHelper.dart';
import '../data/repo/HomeRepository.dart';

class AccountState {
  final bool isLoading;

  AccountState({
    this.isLoading = false
});

  AccountState copyWith({
    bool? isLoading
}) {
    return AccountState(
      isLoading: isLoading ?? this.isLoading
    );
  }
}

class AccountViewModel extends Cubit<AccountState> {
  final HomeRepository homeRepo;

  AccountViewModel({required this.homeRepo}): super(AccountState());

  void clearDatabase() async {
    emit(state.copyWith(isLoading: true));
    await homeRepo.clearDatabase();
    emit(state.copyWith(isLoading: false));
    await AuthHelper.signOut();
  }
}