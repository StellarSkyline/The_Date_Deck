import 'dart:async';

import 'package:date_deck/feature/home/data/model/category.dart';
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
  var streamController = StreamController();
  var databaseState = true;

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();
    final controller = vm.controller;

    setState(() {
      streamController = vm.streamControllerShuffle;
    });

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 8),
        Container(
          height: 42,
          child: HorizontalList(
            onPressed: (index) => {
              vm.setCategoryIndex(index),
              vm.changeStreamDataCategory(Category.values[vm.categoryIndex]),
              vm.setInitialShuffleDate(Category.values[vm.categoryIndex]),
            },
          ),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsets.all(10),
            child: StreamBuilder(
              stream: streamController.stream,
              initialData: vm.initialShuffleDate,
              builder: (_, asyncSnapshot) {
                final dates = asyncSnapshot.data ?? List.empty();
                if (dates.isEmpty) {
                  return EmptyHandler(textTitle: "Please Shuffle Cards");
                } else {
                  return CardSwiper(
                    controller: controller,
                    cardsCount: dates.length,
                    allowedSwipeDirection: AllowedSwipeDirection.symmetric(horizontal: true, vertical: false),
                    onSwipe: (pIndex, cIndex, direction) {
                      switch (direction) {
                        case CardSwiperDirection.right:
                          dates[pIndex].favorite ? dates[pIndex].favorite = false : dates[pIndex].favorite = true;
                          vm.updateDate(dates[pIndex]);
                          vm.changeStreamDataFavorites();
                        case CardSwiperDirection.top:
                          dates[pIndex].favorite = false;
                          vm.updateDate(dates[pIndex]);
                          vm.changeStreamDataFavorites();
                        default:
                          break;
                      }
                      return true;
                    },
                    cardBuilder: (context, index, horizontalThresholdPercentage, verticalThresholdPercentage) {
                      return CardComponent(
                        name: dates[index].fullDescription,
                        suit: dates[index].suit,
                        favorite: dates[index].favorite,
                        categoryName: dates[index].category.displayName,
                        effortValue: dates[index].effortValue,
                        onPress: () =>{
                          if(dates[index].favorite) {
                            controller.swipe(CardSwiperDirection.top)
                          } else {
                            controller.swipe(CardSwiperDirection.right)
                          }
                        },
                      );
                    },
                  );
                }
              },
            ),
          ),
        ),
        Center(
          child: SizedBox(
            width: 228,
            height: 55,
            child: ElevatedButton(
              onPressed: () => {vm.changeStreamDataCategory(Category.values[vm.categoryIndex])},
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xFFE06F7C),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: Text("Shuffle Deck", style: TextStyle(color: Colors.white, fontSize: 16)),
            ),
          ),
        ),
        SizedBox(height: 8),
      ],
    );
  }
}
