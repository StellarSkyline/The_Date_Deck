import 'package:date_deck/feature/home/domain/ShuffleViewModel.dart';
import 'package:date_deck/feature/home/presentation/components/HorizontalList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import '../components/CardComponent.dart';

class ShufflePage extends StatelessWidget {
  const ShufflePage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<ShuffleViewModel>();
    final controller = CardSwiperController();

    return BlocBuilder<ShuffleViewModel, ShuffleState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 8),
            SizedBox(
              height: 42,
              child: HorizontalList(onPressed: (index) => {vm.setCategoryIndex(index), vm.getCategory()}, selectedIndex: state.categoryIndex),
            ),
            Expanded(
              child: state.isLoading
                  ? Align(
                      alignment: Alignment.center,
                      child: SizedBox(width: 200, height: 200, child: CircularProgressIndicator()),
                    )
                  : Align(
                      alignment: Alignment.center,
                      child: CardSwiper(
                        controller: controller,
                        cardsCount: state.dateList.length,
                        allowedSwipeDirection: AllowedSwipeDirection.symmetric(horizontal: true, vertical: false),
                        onSwipe: (pIndex, cIndex, direction) {
                          if (direction == CardSwiperDirection.right) {
                            vm.updateDate(state.dateList[pIndex]);
                          }
                          return true;
                        },
                        cardBuilder: (context, index, horizontalThresholdPercentage, verticalThresholdPercentage) {
                          return CardComponent(
                            name: state.dateList[index].name,
                            suit: state.dateList[index].suit,
                            categoryName: state.dateList[index].category.displayName,
                            effortValue: state.dateList[index].effortValue,
                          );
                        },
                      ),
                    ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.red.withOpacity(0.2), // Tinted background
                    border: Border.all(
                      color: Colors.red, // Stroke color
                      width: 4.0, // Stroke thickness
                    ),
                  ),
                  child: Center(
                    child: IconButton(
                      iconSize: 35,
                      icon: Icon(Icons.close_outlined),
                      style: IconButton.styleFrom(foregroundColor: Colors.white),
                      onPressed: () => controller.swipe(CardSwiperDirection.left),
                    ),
                  ),
                ),

                SizedBox(width: 30),

                Container(
                  width: 70,
                  height: 70,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xFF265368).withOpacity(0.2), // Tinted background
                    border: Border.all(
                      color: Color(0xFF265368), // Stroke color
                      width: 4.0, // Stroke thickness
                    ),
                  ),
                  child: Center(
                    child: IconButton(
                      iconSize: 35,
                      icon: Icon(Icons.favorite_border_outlined),
                      style: IconButton.styleFrom(foregroundColor: Colors.white),
                      onPressed: () => controller.swipe(CardSwiperDirection.right),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
          ],
        );
      },
    );
  }
}
