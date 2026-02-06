import 'package:date_deck/feature/home/data/repo/CardGraphics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'dart:math' as Math;

import '../../data/model/suit.dart';


class CardComponent extends StatelessWidget {
  final String name;
  final Suit suit;
  final String categoryName;
  final int effortValue;

  const CardComponent({super.key, required this.name, required this.suit, required this.categoryName, required this.effortValue});

  @override
  Widget build(BuildContext context) {
  final graphics = CardGraphics();
  final suitColor = graphics.suitList[suit.index]['color'] as Color;
  final suitGraphic = graphics.suitList[suit.index]['suit'] as Widget;

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
                      Text(graphics.cardNumber[effortValue - 1], style: TextStyle(fontSize: 20, color: suitColor)),
                      SizedBox(width: 20, height: 20, child:suitGraphic),
                    ],
                  ),
                ],
              ),
              Text(
                "Category: $categoryName",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17, color: Colors.black),
              ),
              Expanded(child: graphics.graphicsList[effortValue - 1]),
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
                  Column(
                    children: [
                      Transform.rotate(angle: Math.pi, child: SizedBox(width: 20, height: 20, child:suitGraphic)),
                      Transform.rotate(
                        angle: Math.pi,
                        child: Text(graphics.cardNumber[effortValue - 1], style: TextStyle(fontSize: 20, color: suitColor)),
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
