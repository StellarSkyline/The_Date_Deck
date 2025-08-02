import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'dart:math' as Math;

import '../../core/database/suit.dart';
class CardComponent extends StatelessWidget {

    final String name;
    final Suit suit;
    final ValueChanged<int> onPress;

    CardComponent({required this.name, required this.suit, required this.onPress});

    @override
    Widget build(BuildContext context) {
        Widget cardSuit = SvgPicture.asset('assets/icons/icn_club.svg');
        Color textColor = Colors.black;
        List<String> cardNumbers = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K'];
        cardNumbers.shuffle();
        String cardValue = cardNumbers.first;

        switch (suit) {
            case Suit.Club:
                cardSuit = SvgPicture.asset('assets/icons/icn_club.svg');
                textColor = Colors.black;
            case Suit.Spade:
                cardSuit = SvgPicture.asset('assets/icons/icn_spade.svg');
                textColor = Colors.black;
            case Suit.Heart:
                cardSuit = SvgPicture.asset('assets/icons/icn_heart.svg');
                textColor = Color(0xFFE06F7C);
            case Suit.Diamond:
                cardSuit = SvgPicture.asset('assets/icons/icn_diamond.svg');
                textColor = Color(0xFFE06F7C);
        }

        return SizedBox(
            width: 397,
            height: 170,
            child: Card(
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
                                                    fontSize: 15,
                                                    color: textColor
                                                )
                                            ),
                                            cardSuit
                                        ]
                                    )
                                ]
                            ),
                            Expanded(
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
                                                width: 121,
                                                height: 25,
                                                child: ElevatedButton(
                                                    onPressed: () => {},
                                                    style: ElevatedButton.styleFrom(
                                                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                        backgroundColor: Color(0xFFE06F7C)
                                                    ),
                                                    child: Text("Favorite",
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
                                                        fontSize: 15,
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
