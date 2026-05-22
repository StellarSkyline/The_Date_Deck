import 'dart:convert';
import 'dart:math';

import 'package:date_deck/feature/home/data/model/category.dart';
import 'package:date_deck/feature/home/data/model/suit.dart';
import 'package:date_deck/feature/home/data/repo/HomeRepository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/date.dart';


class AddState{
  final bool isLoading;
  final Date saveDate;

  AddState({
    this.isLoading = false,
    required this.saveDate,
  });

  AddState copyWith({
    bool? isLoading,
    Date? saveDate,
  }) {
    return AddState(
      isLoading: isLoading ?? this.isLoading,
      saveDate: saveDate ?? this.saveDate,
    );
  }
}

class AddViewModel extends Cubit<AddState> {
  final HomeRepository homeRepo;

  //Constructor
  AddViewModel({required this.homeRepo})
    : super(
        AddState(
          saveDate: Date(
            id: 0,
            name: '',
            category: Category.Active,
            suit: Suit.Club,
            effortValue: 0,
            favorite: 0,
          ),
        ),
      );

  void updateDate(Date newDate) {
    emit(state.copyWith(saveDate: newDate));
    saveDate();
  }

  void saveDate() async {
    emit(state.copyWith(isLoading: true));
    var generatedId = Random().nextInt(9999);
    final Map<String, dynamic> requestBody = {
      "Category": state.saveDate.category.displayName,
      "Effort Value":  state.saveDate.effortValue,
      "Name": state.saveDate.name,
      "Suit": state.saveDate.suit.name,
      "id": generatedId
    };

    final body = jsonEncode(requestBody);
    var response = await homeRepo.postDate(body, state.saveDate.category);

    if(response) {
      emit(state.copyWith(isLoading: false));
    }
  }
}
