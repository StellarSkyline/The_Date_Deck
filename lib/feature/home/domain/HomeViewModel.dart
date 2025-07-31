import 'package:date_deck/feature/home/data/HomeRepository.dart';
import 'package:flutter/cupertino.dart';

class HomeViewModel extends ChangeNotifier {

  final _HomeRepo = HomeRepository();


  String test() {
    return "Im called from the VM";
  }

}