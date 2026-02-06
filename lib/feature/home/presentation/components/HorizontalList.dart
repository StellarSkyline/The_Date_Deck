import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/HomeViewModel.dart';

class HorizontalList extends StatelessWidget {
  final ValueChanged<int> onPressed;
  final int selectedIndex;

  HorizontalList({super.key, required this.onPressed, required this.selectedIndex});

  final List items = ["Active", "Creative", "Games", "Cooking"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsetsGeometry.all(5.0),
          child: ElevatedButton(
            onPressed: () => {onPressed(index)},
            style: ElevatedButton.styleFrom(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              backgroundColor: selectedIndex == index ? Color(0xFFE06F7C) : Color(0xFF5E4E81),
            ),
            child: Text(items[index], style: TextStyle(color: Colors.white, fontSize: 15.0)),
          ),
        );
      },
    );
  }
}
