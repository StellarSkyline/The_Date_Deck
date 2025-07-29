import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class BottomNav extends StatefulWidget {

  final ValueChanged<int> onPressed;

  const BottomNav({super.key, required this.onPressed});


  @override
  State<StatefulWidget> createState() => _BottomNavState();

}

class _BottomNavState extends State<BottomNav> {

  List<BottomNavigationBarItem> items =[
    BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/icn_home_unselected.svg'), label: 'Home'),
    BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/icn_shuffle_unselected.svg'), label: 'Shuffle'),
    BottomNavigationBarItem(icon: SvgPicture.asset('assets/icons/icn_favorites_unselected.svg'), label: 'Favorites')
  ];


  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      items: items,
      backgroundColor: Color(0xFFFBF8F0),
      type: BottomNavigationBarType.fixed,
      
    );
  }
}

