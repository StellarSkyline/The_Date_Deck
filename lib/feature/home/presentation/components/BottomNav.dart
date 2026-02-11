import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

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
                BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/icn_shuffle.svg', color: _currentSelection == 0 ? colorScheme.primary : colorScheme.secondary), label: 'Shuffle'),
                BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/icn_favorites.svg', color: _currentSelection == 1 ? colorScheme.primary: colorScheme.secondary), label: 'Favorites'),
                BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/icn_edit.svg', color: _currentSelection == 2 ? colorScheme.primary: colorScheme.secondary), label: 'Add Date')
            ],
            currentIndex: _currentSelection,
            type: BottomNavigationBarType.fixed,
            onTap: (index) => {
                widget.onPressed(index),
                setState(() {
                        _currentSelection = index;
                    }
                )
            },
            unselectedItemColor: colorScheme.secondary,
            selectedItemColor: colorScheme.primary
        );
    }
}

