import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';

class BottomNav extends StatefulWidget {
  final ValueChanged<int> onPressed;

  const BottomNav({super.key, required this.onPressed});

  @override
  State<StatefulWidget> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  var _currentSelection = 0;
  bool _isOnline = true;
  StreamSubscription<List<ConnectivityResult>>? _connectivitySubscription;

  @override
  void initState() {
    super.initState();
    _checkConnectivity();
    // Listen to connectivity changes
    _connectivitySubscription = Connectivity().onConnectivityChanged.listen((List<ConnectivityResult> results) {
      setState(() {
        _isOnline = results.any((result) =>
        result != ConnectivityResult.none
        );
      });
    });
  }

  Future<void> _checkConnectivity() async {
    final connectivityResults = await Connectivity().checkConnectivity();
    setState(() {
      _isOnline = connectivityResults.any((result) =>
      result != ConnectivityResult.none
      );
    });
  }

  @override
  void dispose() {
    _connectivitySubscription?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return BottomNavigationBar(
      elevation: 0,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.shuffle), label: "Shuffle"),
        BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorites'),
        BottomNavigationBarItem(
          icon: Icon(Icons.edit, color: _isOnline ? null : Colors.grey.shade400),
          label: "Add Date Idea",
        ),
        BottomNavigationBarItem(icon: Icon(Icons.account_circle), label: 'Account'),
      ],
      currentIndex: _currentSelection,
      type: BottomNavigationBarType.fixed,
      onTap: (index) {
        // Block navigation to "Add Date Idea" (index 2) when offline
        if (index == 2 && !_isOnline) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text('No internet connection'),
              backgroundColor: colorScheme.error,
              duration: Duration(seconds: 2),
            ),
          );
          return;
        }

        widget.onPressed(index);
        setState(() {
          _currentSelection = index;
        });
      },
      unselectedItemColor: (_currentSelection != 2 || _isOnline) ? colorScheme.secondary : Colors.grey.shade400,
      selectedItemColor: colorScheme.primary,
    );
  }
}
