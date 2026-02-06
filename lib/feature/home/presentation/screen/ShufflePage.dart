import 'package:date_deck/feature/home/domain/ShuffleBloc/ShuffleViewModel.dart';
import 'package:date_deck/feature/home/presentation/components/HorizontalList.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_card_swiper/flutter_card_swiper.dart';

import '../../domain/ShuffleBloc/ShuffleState.dart';
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
              child: HorizontalList(
                onPressed: (index) => {
                  vm.setCategoryIndex(index),
                  vm.getCategory()
                },
                selectedIndex: state.categoryIndex,
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsGeometry.all(10),
                child: state.isLoading
                    ? Align(
                        alignment: Alignment.center,
                        child: SizedBox(
                          width: 100,
                          height: 100,
                          child: CircularProgressIndicator(),
                        ),
                      )
                    : CardSwiper(
                        controller: controller,
                        cardsCount: state.dateList.length,
                        allowedSwipeDirection: AllowedSwipeDirection.symmetric(
                          horizontal: true,
                          vertical: false,
                        ),
                        onSwipe: (pIndex, cIndex, direction) {
                          if (direction == CardSwiperDirection.right) {
                            vm.insertDate(state.dateList[pIndex]);
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
                                name: state.dateList[index].name,
                                suit: state.dateList[index].suit,
                                categoryName: state.dateList[index].category.displayName,
                                effortValue: state.dateList[index].effortValue,
                              );
                            },
                      ),
              ),
            ),
          ],
        );
      },
    );
  }
}
