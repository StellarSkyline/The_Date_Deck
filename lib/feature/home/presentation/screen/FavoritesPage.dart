import 'dart:async';

import 'package:date_deck/feature/home/presentation/components/CardFavoriteComponent.dart';
import 'package:date_deck/feature/home/presentation/components/EmptyHandler.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/HomeViewModel.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 8),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: FutureBuilder(
              future: vm.getFavorites(),
              builder: (context, snapShot) {
                final dates = snapShot.data ?? List.empty();
                if (dates.isEmpty) {
                  return EmptyHandler(textTitle: "Favorites is Empty");
                } else {
                  return ListView.builder(
                    itemCount: dates.length,
                    itemBuilder: (context, index) {
                      return CardFavoriteComponent(
                        name: dates[index].name,
                        suit: dates[index].suit,
                        categoryName: dates[index].category.displayName,
                        effortValue: dates[index].effortValue,
                        onPress: (value) => {vm.deleteDate(dates[index])},
                      );
                    },
                  );
                }
              },
            ),
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
