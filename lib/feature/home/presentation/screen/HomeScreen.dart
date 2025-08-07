import 'package:date_deck/feature/home/presentation/components/BottomNav.dart';
import 'package:date_deck/feature/home/presentation/screen/FavoritesPage.dart';
import 'package:date_deck/feature/home/presentation/screen/SplashPage.dart';
import 'package:date_deck/feature/home/presentation/screen/ShufflePage.dart';
import 'package:flutter/material.dart';

import '../components/EmptyHandler.dart';

class HomeScreen extends StatefulWidget {

    @override
    State<StatefulWidget> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

    var _currentPage = 0;

    @override
    Widget build(BuildContext context) {

        final List pages = [
            ShufflePage(),
            FavoritesPage()
        ];

        return SafeArea(child:
            Scaffold(
                backgroundColor: Color(0xFFF4F4F4),
                bottomNavigationBar: BottomNav(onPressed: (index) => {
                        setState(() {
                                _currentPage = index;
                            }
                        )
                    }
                ),
                body: pages[_currentPage]

            )
        );
    }

}
