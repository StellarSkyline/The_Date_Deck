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
    final graphics = CardGraphics();
    final suitGraphic = graphics.getFaveSuitGraphic(suit.index);
    final suitColor = graphics.getFaveCardColor(suit.index);

    return Container(
      width: 397,
      height: 120,
      decoration: BoxDecoration(
        color: Colors.transparent,
        border: Border.all(color: Color(0xFF949AA6), width: 1.0),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(width: 80, height: 80, child: graphics.graphicsList[effortValue - 1]),
          SizedBox(width: 10),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          suitGraphic,
                          SizedBox(width: 5),
                          Text(graphics.cardNumber[effortValue - 1], style: TextStyle(fontSize: 15, color: suitColor)),
                        ],
                      ),

                      SizedBox(width: 10),

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
                    ],
                  ),
                  SizedBox(height: 10),

                  Text(
                    name,
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 12, color: Colors.white, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),

          IconButton(
            onPressed: () => onPress(0),
            icon: Icon(Icons.delete_outline_outlined, color: Colors.red, size: 30),
          ),

          SizedBox(width: 10),
        ],
      ),
    );
  }
}
