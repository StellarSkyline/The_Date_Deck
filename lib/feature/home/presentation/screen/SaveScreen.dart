import 'package:date_deck/feature/home/presentation/components/EmptyHandler.dart';
import 'package:flutter/material.dart';

class SaveScreen extends StatelessWidget {
  const SaveScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF4F4F4),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(backgroundColor: Color(0xFFF4F4F4)),
          backgroundColor: Color(0xFFF4F4F4),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [EmptyHandler(textTitle: 'Date Idea successfully saved to server')],
          ),
        ),
      ),
    );
  }
}
