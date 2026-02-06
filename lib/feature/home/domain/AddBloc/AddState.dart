import 'package:date_deck/feature/home/data/model/category.dart';
import 'package:date_deck/feature/home/data/model/suit.dart';

import '../../data/model/date.dart';

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