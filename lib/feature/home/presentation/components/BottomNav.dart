import 'package:date_deck/feature/home/data/repo/ConnectivityHelper.dart';
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
  void initState() {
    super.initState();
    // Listen to global connectivity changes
    ConnectivityHelper.onConnectivityChanged.listen((isOnline) {
      setState(() {
        // Rebuild UI when connectivity changes
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    List<BottomNavigationBarItem> pages = [
      BottomNavigationBarItem(icon: Icon(Icons.shuffle), label: "Shuffle"),
      BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
      BottomNavigationBarItem(icon: Icon(Icons.edit), label: "Add Date Idea"),
      BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
    ];

    if (!ConnectivityHelper.isOnline) {
      pages.removeAt(2);
    }

    return BottomNavigationBar(
      elevation: 0,
      items: pages,
      currentIndex: _currentSelection,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        widget.onPressed(index);
        setState(() {
          _currentSelection = index;
        });
      },
      unselectedItemColor: colorScheme.secondary,
      selectedItemColor: colorScheme.primary,
    );
  }
}
