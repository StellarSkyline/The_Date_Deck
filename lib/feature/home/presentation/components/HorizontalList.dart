import 'package:flutter/material.dart';

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
          padding: EdgeInsets.only(left: 15, right: 5),

          child: InputChip(

            label: Text(
              items[index],
              style: TextStyle(color: Color(0xFF949AA6), fontSize: 15.0),
            ),

            selected: selectedIndex == index,

            backgroundColor: Color(0xFF172034),

            selectedColor: Color(0xFF4E81EE),

            onPressed: () => {onPressed(index)},

            showCheckmark: false,

            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(70.0),
            ),

            side: BorderSide(
              color: Color(0xFF949AA6),
              width: 1,
            ),
          ),
        );
      },
    );
  }
}
