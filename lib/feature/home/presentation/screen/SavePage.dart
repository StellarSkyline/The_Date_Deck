import 'dart:async';

import 'package:date_deck/feature/home/presentation/components/EmptyHandler.dart';
import 'package:flutter/material.dart';

import 'HomeScreen.dart';

class SavePage extends StatelessWidget {
  const SavePage({super.key});

  @override
  Widget build(BuildContext context) {

    //Jump Back to HomeScreen after 5 seconds
    Timer(Duration(seconds: 5), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });

    final colorScheme = Theme.of(context).colorScheme;
    return Container(
      color: Color(0xFFF4F4F4),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(backgroundColor: colorScheme.surface),
          backgroundColor: colorScheme.surface,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [EmptyHandler(textTitle: 'Date Idea Saved', textDescription: "Thank you for adding ideas to the Deck",)],
          ),
        ),
      ),
    );
  }
}
