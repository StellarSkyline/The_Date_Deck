import 'package:date_deck/feature/home/presentation/components/CardComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../data/model/suit.dart';


class FavoritesPage extends StatelessWidget{

    @override
    Widget build(BuildContext context) {
        return CardComponent(
            name: "test",
            suit: Suit.Diamond,
            onPress: (index) => {}
        );
    }
}
