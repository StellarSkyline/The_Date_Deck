import 'dart:math' as Math;

import 'package:flutter/material.dart';
import '../../data/model/suit.dart';
import '../../data/repo/CardGraphics.dart';

class CardFavoriteComponent extends StatelessWidget {
  final String name;
  final Suit suit;
  final ValueChanged onPress;
  final String categoryName;
  final int effortValue;

  const CardFavoriteComponent({super.key, required this.name, required this.suit, required this.onPress, required this.categoryName, required this.effortValue});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final graphics = CardGraphics();
    final suitGraphic = graphics.getSuitGraphic(suit.index, colorScheme.onSurface);

    return SizedBox(
      width: 397,
      height: 200,
      child: Card(
        elevation: 15,
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
            side: BorderSide(
              color: colorScheme.outline,
              width: 2,
            )
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
                      Text(graphics.cardNumber[effortValue - 1], style: TextStyle(fontSize: 15, color: colorScheme.onSurface)),
                      suitGraphic,
                    ],
                  ),
                ],
              ),

              Expanded(
                child: Row(
                  children: [
                    SizedBox(width: 100, height:100, child:graphics.graphicsList[effortValue - 1]),
                    SizedBox(width:10),
                    Expanded(
                      child:
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "Category: $categoryName",
                                textAlign: TextAlign.center,
                                style: TextStyle(fontSize: 17, color: colorScheme.onSurface),
                              ),
                              Text(
                                name,
                                softWrap: true,
                                textAlign: TextAlign.left,
                                style: TextStyle(fontSize: 15, color: colorScheme.onSurface),
                              ),
                            ],
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
                      Transform.rotate(angle: Math.pi, child: suitGraphic),
                      Transform.rotate(
                        angle: Math.pi,
                        child: Text(graphics.cardNumber[effortValue - 1], style: TextStyle(fontSize: 15, color: colorScheme.onSurface)),
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
