import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../domain/HomeViewModel.dart';

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
        final vm = context.watch<HomeViewModel>();

        return BottomNavigationBar(
            elevation: 0,
            items: [
                BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/icn_shuffle.svg', color: _currentSelection == 0 ? Color(0xFFE06F7C) : Color(0xFF5E4E81)), label: 'Shuffle'),
                BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/icn_favorites.svg', color: _currentSelection == 1 ? Color(0xFFE06F7C) : Color(0xFF5E4E81)), label: 'Favorites'),
                BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/icn_edit.svg', color: _currentSelection == 2 ? Color(0xFFE06F7C) : Color(0xFF5E4E81)), label: 'Add Date')
            ],
            currentIndex: _currentSelection,
            backgroundColor: Color(0xFFFBF8F0),
            type: BottomNavigationBarType.fixed,
            onTap: (index) => {
                widget.onPressed(index),
                setState(() {
                        _currentSelection = index;
                    }
                )
            },
            unselectedItemColor: Color(0xFF5E4E81),
            selectedItemColor: Color(0xFFE06F7C)
        );
    }
}

