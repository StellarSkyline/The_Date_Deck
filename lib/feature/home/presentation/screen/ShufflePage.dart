import 'dart:async';

import 'package:date_deck/feature/home/presentation/components/HorizontalList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:provider/provider.dart';

import '../../domain/HomeViewModel.dart';
import '../components/CardComponent.dart';
import '../components/EmptyHandler.dart';

class ShufflePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ShufflePageState();
}

class _ShufflePageState extends State<ShufflePage> {
  var databaseState = true;

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();
    final controller = vm.controller;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 8),
        Container(height: 42, child: HorizontalList(onPressed: (index) => vm.setCategoryIndex(index))),
        Expanded(
          child: Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: FutureBuilder(
              future: vm.getCategory(vm.categoryIndex),
              builder: (context, snapshot) {
                final dates = snapshot.data;
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator();
                } else if (snapshot.hasError) {
                  return EmptyHandler(textTitle: "Please Shuffle Cards");
                } else {
                  return CardSwiper(
                    controller: controller,
                    cardsCount: snapshot.data!.length,
                    allowedSwipeDirection: AllowedSwipeDirection.symmetric(horizontal: true, vertical: false),
                    onSwipe: (pIndex, cIndex, direction) {
                      switch (direction) {
                        case CardSwiperDirection.right:
                          vm.insertDate(dates![pIndex]);
                        case CardSwiperDirection.top:
                          dates![pIndex].favorite = false;
                          vm.insertDate(dates[pIndex]);
                        default:
                          break;
                      }
                      return true;
                    },
                    cardBuilder: (context, index, horizontalThresholdPercentage, verticalThresholdPercentage) {
                      return CardComponent(
                        name: dates![index].fullDescription,
                        suit: dates[index].suit,
                        favorite: dates[index].favorite,
                        categoryName: dates[index].category.displayName,
                        effortValue: dates[index].effortValue,
                        onPress: () => {
                          if (dates[index].favorite) {controller.swipe(CardSwiperDirection.top)} else {controller.swipe(CardSwiperDirection.right)},
                        },
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
