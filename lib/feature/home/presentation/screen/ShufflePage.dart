import 'package:date_deck/feature/home/presentation/components/HorizontalList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';
import 'package:provider/provider.dart';
import '../../domain/HomeViewModel.dart';
import '../components/CardComponent.dart';
import '../components/EmptyHandler.dart';

class ShufflePage extends StatelessWidget {
  const ShufflePage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();
    final controller = vm.controller;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 8),
        Container(
          height: 42,
          child: HorizontalList(onPressed: (index) => vm.setCategoryIndex(index), selectedIndex: vm.categoryIndex,),
        ),
        Expanded(
          child: Padding(
            padding: EdgeInsetsGeometry.all(10),
            child: FutureBuilder(
              future: vm.getCategory(vm.categoryIndex),
              builder: (context, snapshot) {
                final dates = snapshot.data;
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Align(
                    alignment: Alignment.center,
                    child: Container(width: 100, height: 100, child: CircularProgressIndicator()),
                  );
                } else if (snapshot.hasError) {
                  return EmptyHandler(textTitle: "Please select a different category");
                } else {
                  return CardSwiper(
                    controller: controller,
                    cardsCount: snapshot.data!.length,
                    allowedSwipeDirection: AllowedSwipeDirection.symmetric(
                      horizontal: true,
                      vertical: false,
                    ),
                    onSwipe: (pIndex, cIndex, direction) {
                      if (direction == CardSwiperDirection.right) {
                        vm.insertDate(dates![pIndex]);
                      }
                      return true;
                    },
                    cardBuilder:
                        (
                          context,
                          index,
                          horizontalThresholdPercentage,
                          verticalThresholdPercentage,
                        ) {
                          return CardComponent(
                            name: dates![index].name,
                            suit: dates[index].suit,
                            categoryName: dates[index].category.displayName,
                            effortValue: dates[index].effortValue,
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
