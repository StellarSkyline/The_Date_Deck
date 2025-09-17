import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'dart:math' as Math;

import '../../data/model/suit.dart';
import '../../domain/HomeViewModel.dart';

class CardComponent extends StatelessWidget {
  final String name;
  final Suit suit;
  final bool favorite;
  final VoidCallback onPress;
  final String categoryName;
  final int effortValue;

  const CardComponent({super.key, required this.name, required this.suit, required this.favorite, required this.onPress, required this.categoryName, required this.effortValue});

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();

    return SizedBox(
      width: 483,
      height: 609,
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
                      Text(vm.cardNumbers[effortValue - 1], style: TextStyle(fontSize: 20, color: vm.suitGraphics[suit.index]['color'])),
                      SizedBox(width: 20, height: 20, child:vm.suitGraphics[suit.index]['suit']),
                    ],
                  ),
                ],
              ),
              Text(
                "Category: $categoryName",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
              Expanded(child: vm.graphics[effortValue - 1]),
              Padding(
                padding: EdgeInsetsGeometry.all(8.0),
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: Colors.black),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Center(
                      child: SizedBox(
                        width: 150,
                        height: 35,
                        child: ElevatedButton(
                          onPressed: () => {onPress()},
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            backgroundColor: (favorite ? Color(0xFFE06F7C) : Color(0xFF5E4E81)),
                          ),
                          child: Text(favorite ? "Remove" : "Favorite", style: TextStyle(color: Colors.white, fontSize: 15.0)),
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      Transform.rotate(angle: Math.pi, child: SizedBox(width: 20, height: 20, child:vm.suitGraphics[suit.index]['suit'])),
                      Transform.rotate(
                        angle: Math.pi,
                        child: Text(vm.cardNumbers[effortValue - 1], style: TextStyle(fontSize: 20, color: vm.suitGraphics[suit.index]['color'])),
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
