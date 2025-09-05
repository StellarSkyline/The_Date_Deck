import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as Math;

import '../../data/model/suit.dart';

class CardComponent extends StatelessWidget {

    final String name;
    final Suit suit;
    final bool favorite;
    final ValueChanged onPress;
    final String categoryName;
    final int effortValue;

    CardComponent({required this.name, required this.suit, required this.favorite, required this.onPress, required this.categoryName, required this.effortValue});

    @override
    Widget build(BuildContext context) {
        Widget cardSuit = SvgPicture.asset('assets/icons/icn_club.svg');
        Color textColor = Colors.black;
        List<String> cardNumbers = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K'];

        String cardValue = cardNumbers[effortValue-1];

        switch (suit) {
            case Suit.Club:
                cardSuit = SvgPicture.asset('assets/icons/icn_club.svg',height:20,width:20);
                textColor = Colors.black;
            case Suit.Spade:
                cardSuit = SvgPicture.asset('assets/icons/icn_spade.svg',height:20,width:20);
                textColor = Colors.black;
            case Suit.Heart:
                cardSuit = SvgPicture.asset('assets/icons/icn_heart.svg',height:20,width:20);
                textColor = Color(0xFFE06F7C);
            case Suit.Diamond:
                cardSuit = SvgPicture.asset('assets/icons/icn_diamond.svg',height:20,width:20);
                textColor = Color(0xFFE06F7C);
        }

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
                                            Text(cardValue,
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    color: textColor
                                                )
                                            ),
                                            cardSuit
                                        ]
                                    )
                                ]
                            ),
                            Text(
                                "Category: $categoryName",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 17,
                                    color: Colors.black

                                )
                            ),
                            Expanded(
                                child: Image.asset(
                                    'assets/images/img_test.png',
                                  fit: BoxFit.cover
                                )
                            ),
                          Padding(
                              padding: EdgeInsetsGeometry.all(8.0),
                              child: Text(
                                  name,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black
                                  )
                              )
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
                                                    onPressed: () => {
                                                        onPress(0)
                                                    },
                                                    style: ElevatedButton.styleFrom(
                                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                        backgroundColor: (favorite ? Color(0xFFE06F7C) : Color(0xFF5E4E81))
                                                    ),
                                                    child: Text(favorite ? "Remove" : "Favorite",
                                                        style: TextStyle(
                                                            color: Colors.white,
                                                            fontSize: 15.0
                                                        )
                                                    )
                                                )
                                            )
                                        )
                                    ),
                                    Column(
                                        children: [

                                            Transform.rotate(
                                                angle: Math.pi,
                                                child: cardSuit
                                            ),
                                            Transform.rotate(
                                                angle: Math.pi,
                                                child: Text(cardValue,
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        color: textColor
                                                    )
                                                )
                                            )
                                        ]
                                    )

                                ]
                            )

                        ]
                    )
                )
            )
        );
    }

}
