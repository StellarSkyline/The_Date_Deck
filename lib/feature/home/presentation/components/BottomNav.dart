import 'package:date_deck/helpers/ConnectivityHelper.dart';
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
    List<BottomNavigationBarItem> pages = [
      BottomNavigationBarItem(icon: Icon(Icons.shuffle), label: "Shuffle"),
      BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
      BottomNavigationBarItem(icon: Icon(Icons.edit), label: "Add Date Idea"),
      BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
    ];

    if (!ConnectivityHelper.isOnline) {
      pages.removeAt(2);
    }

    return Container(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFF111F41), width: 2.0)),
      ),
      child: BottomNavigationBar(
        unselectedItemColor: Color(0xFF949AA6),
        selectedItemColor: Color(0xFF70A3F3),
        backgroundColor: Color(0xFF060F22),
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
      ),
    );
  }
}
