import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/model/date.dart';
import '../../data/repo/HomeRepository.dart';
import 'FavoriteState.dart';

class FavoriteViewModel extends Cubit<FavoriteState> {
  final HomeRepository homeRepo;

  //Constructor and Home Repo injection
  FavoriteViewModel({required this.homeRepo}) : super(FavoriteState());

  void getFavorites() async {
    emit(state.copyWith(isEmpty: true));
    final favorites = await homeRepo.getFavorites();
    emit(state.copyWith(favoriteList: favorites, isEmpty: false));
  }

  void deleteDate(Date date) {
    homeRepo.deleteDate(date);
    getFavorites();
  }
}
