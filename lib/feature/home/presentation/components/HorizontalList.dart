import 'package:flutter/material.dart';

class HorizontalList extends StatelessWidget {
  final ValueChanged<int> onPressed;
  final int selectedIndex;

  HorizontalList({super.key, required this.onPressed, required this.selectedIndex});

  final List items = ["Active", "Creative", "Games", "Cooking"];

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: items.length,
      itemBuilder: (context, index) {
        return Padding(
          padding: EdgeInsets.only(left: 15, right: 5),
          child: InputChip(
            label: Text(
              items[index],
              style: TextStyle(color: colorScheme.onPrimary, fontSize: 15.0),
            ),
            backgroundColor: selectedIndex == index ? colorScheme.primary : colorScheme.secondary,
            onPressed: () => {onPressed(index)},
          ),
        );
      },
    );
  }
}
