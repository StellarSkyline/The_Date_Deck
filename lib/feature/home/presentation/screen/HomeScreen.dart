import 'package:date_deck/core/database/date_dao.dart';
import 'package:date_deck/feature/favorites/presentation/screen/FavoritesPage.dart';
import 'package:date_deck/feature/home/presentation/components/BottomNav.dart';
import 'package:date_deck/feature/home/presentation/screen/HomePage.dart';
import 'package:date_deck/feature/shuffle/presentation/screen/ShufflePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
    final DateDao dao;

    const HomeScreen({super.key, required this.dao});

    @override
    State<StatefulWidget> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

    var _currentPage = 0;

    final List pages = [
        HomePage(),
        ShufflePage(),
        FavoritesPage()
    ];

    @override
    Widget build(BuildContext context) {
        return SafeArea(child:
            Scaffold(
                backgroundColor: Color(0xFFF4F4F4),
                appBar: AppBar(
                    title: Text("Date Deck"),
                    centerTitle: true,
                    backgroundColor: Color(0xFFFBF8F0)
                ),
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
