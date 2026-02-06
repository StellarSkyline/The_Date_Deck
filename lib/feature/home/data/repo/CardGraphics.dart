import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardGraphics{

  CardGraphics();

  //Graphics Assets
  final graphicsList = [
    Image.asset('assets/images/img_1.png', fit: BoxFit.contain),
    Image.asset('assets/images/img_2.png', fit: BoxFit.contain),
    Image.asset('assets/images/img_3.png', fit: BoxFit.contain),
    Image.asset('assets/images/img_4.png', fit: BoxFit.contain),
    Image.asset('assets/images/img_5.png', fit: BoxFit.contain),
    Image.asset('assets/images/img_6.png', fit: BoxFit.contain),
    Image.asset('assets/images/img_7.png', fit: BoxFit.contain),
    Image.asset('assets/images/img_8.png', fit: BoxFit.contain),
    Image.asset('assets/images/img_9.png', fit: BoxFit.contain),
    Image.asset('assets/images/img_10.png', fit: BoxFit.contain),
    Image.asset('assets/images/img_11.png', fit: BoxFit.contain),
    Image.asset('assets/images/img_12.png', fit: BoxFit.contain),
    Image.asset('assets/images/img_13.png', fit: BoxFit.contain),
  ];

  final suitList = [
    {
      'suit': SvgPicture.asset('assets/icons/icn_club.svg', fit: BoxFit.fill),
      'color': Colors.black,
    },
    {
      'suit': SvgPicture.asset('assets/icons/icn_spade.svg', fit: BoxFit.fill),
      'color': Colors.black,
    },
    {
      'suit': SvgPicture.asset('assets/icons/icn_heart.svg', fit: BoxFit.fill),
      'color': Color(0xFFE06F7C),
    },
    {
      'suit': SvgPicture.asset('assets/icons/icn_diamond.svg', fit: BoxFit.fill),
      'color': Color(0xFFE06F7C),
    },
  ];

  final cardNumber = ['A', '2', '3', '4', '5', '6', '7', '8', '9', '10', 'J', 'Q', 'K'];
}