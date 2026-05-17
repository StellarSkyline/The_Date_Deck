import 'dart:math' as Math;

import 'package:date_deck/feature/home/data/repo/CardGraphics.dart';
import 'package:flutter/material.dart';

import '../../data/model/suit.dart';

class CardComponent extends StatelessWidget {
  final String name;
  final Suit suit;
  final String categoryName;
  final int effortValue;

  const CardComponent({super.key, required this.name, required this.suit, required this.categoryName, required this.effortValue});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final graphics = CardGraphics();
    final suitGraphic = graphics.getSuitGraphic(suit.index);
    final suitColor = graphics.getCardColor(suit.index);

    return SizedBox(
      width: 483,
      height: 609,
      child: Card(
        elevation: 15,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
          side: BorderSide(color: colorScheme.outline, width: 2),
        ),
        color: colorScheme.surface,
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
                      SizedBox(width: 20, height: 20, child: suitGraphic),
                    ],
                  ),
                ],
              ),
              Text(
                "Category: $categoryName",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 17, color: colorScheme.onSurface),
              ),
              Expanded(child: graphics.graphicsList[effortValue - 1]),
              Padding(
                padding: EdgeInsetsGeometry.all(8.0),
                child: Text(
                  name,
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 15, color: colorScheme.onSurface),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Column(
                    children: [
                      Transform.rotate(
                        angle: Math.pi,
                        child: SizedBox(width: 20, height: 20, child: suitGraphic),
                      ),
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
