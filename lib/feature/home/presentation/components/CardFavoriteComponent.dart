import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'dart:math' as Math;

import '../../data/model/suit.dart';
import '../../domain/HomeViewModel.dart';

//TODO: Add Category Title to Card
class CardFavoriteComponent extends StatelessWidget {
  final String name;
  final Suit suit;
  final bool favorite;
  final ValueChanged onPress;
  final String categoryName;
  final int effortValue;

  const CardFavoriteComponent({super.key, required this.name, required this.suit, required this.favorite, required this.onPress, required this.categoryName, required this.effortValue});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();

    return SizedBox(
      width: 397,
      height: 200,
      child: Card(
        elevation: 8,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Color(0xFFFBF8F0),
        child: Padding(
          padding: EdgeInsetsGeometry.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Column(
                    children: [
                      Text(vm.cardNumbers[effortValue - 1], style: TextStyle(fontSize: 15, color: vm.suitGraphics[suit.index]['color'])),
                      vm.suitGraphics[suit.index]['suit'],
                    ],
                  ),
                ],
              ),
              Text(
                "Category: $categoryName",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
              Expanded(
                child: Row(
                  children: [
                    SizedBox(width: 100, height:100, child:vm.graphics[effortValue - 1]),
                    Expanded(
                      child: Text(
                        name,
                        softWrap: true,
                        textAlign: TextAlign.left,
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Center(
                      child: Padding(
                        padding: EdgeInsetsGeometry.directional(start: 0, end: 8, top: 0, bottom: 0),
                        child: SizedBox(
                          width: 115,
                          height: 25,
                          child: ElevatedButton(
                            onPressed: () => {onPress(0)},
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                              backgroundColor: (Color(0xFFE06F7C)),
                            ),
                            child: Text("Remove",
                                style: TextStyle(color: Colors.white, fontSize: 15.0)
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Transform.rotate(angle: Math.pi, child: vm.suitGraphics[suit.index]['suit']),
                      Transform.rotate(
                        angle: Math.pi,
                        child: Text(vm.cardNumbers[effortValue - 1], style: TextStyle(fontSize: 15, color: vm.suitGraphics[suit.index]['color'])),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
