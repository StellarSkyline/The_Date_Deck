import 'package:date_deck/feature/home/presentation/components/CardComponent.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../data/model/suit.dart';
import '../../domain/HomeViewModel.dart';


class FavoritesPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();


    return  Padding(
            padding: EdgeInsets.all(10),
            child: StreamBuilder(
                stream: vm.dao.getFavorites(),
                builder: (_, asyncSnapshot) {
                  final dates = asyncSnapshot.data ?? List.empty();
                  print(dates);
                  return ListView.builder(
                      itemCount: dates.length,
                      //Add Item Count here
                      itemBuilder: (context, index) {
                        return CardComponent(name: dates[index].fullDescription,
                            suit: dates[index].suit,
                            onPress: (index) =>
                            {
                              dates[index].favorite = !dates[index].favorite,
                              vm.dao.updateDate(dates[index]),
                            });
                      }
                  );
                }
            )

    );
  }
}
