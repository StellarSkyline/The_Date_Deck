import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  final ValueChanged<int> onPressed;

  const BottomNav({super.key, required this.onPressed});

  @override
  State<StatefulWidget> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  var _currentSelection = 0;

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return BottomNavigationBar(
      elevation: 0,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.shuffle), label: "Shuffle"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
        BottomNavigationBarItem(icon: Icon(Icons.edit), label: "Add Date Idea"),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
      ],
      currentIndex: _currentSelection,
      type: BottomNavigationBarType.fixed,
      onTap: (index) => {
        widget.onPressed(index),
        setState(() {
          _currentSelection = index;
        }),
      },
      unselectedItemColor: colorScheme.secondary,
      selectedItemColor: colorScheme.primary,
    );
  }
}
