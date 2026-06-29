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
    final graphics = CardGraphics();
    final suitGraphic = graphics.getSuitGraphic(suit.index);
    final suitColor = graphics.getCardColor(suit.index);

    return SizedBox(
      child: Card(
        elevation: 15,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Color(0xfffff8f7),
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
              Expanded(
                child: Align(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 300, width: 300, child: graphics.graphicsList[effortValue - 1]),
                      Padding(
                        padding: EdgeInsets.only(left: 8, right: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: 60,
                              height: 20,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: Color(0xFF4E81EE), // Background color
                                borderRadius: BorderRadius.circular(20.0), // Makes it pill-shaped
                              ),
                              child: Text(
                                categoryName,
                                style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                              ),
                            ),

                            SizedBox(height: 10),

                            Text(
                              name,
                              textAlign: TextAlign.left,
                              style: TextStyle(fontSize: 15, color: Colors.black, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
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
