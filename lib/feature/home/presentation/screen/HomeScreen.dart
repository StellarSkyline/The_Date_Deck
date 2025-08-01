import 'package:date_deck/feature/home/presentation/components/BottomNav.dart';
import 'package:date_deck/feature/home/presentation/screen/FavoritesPage.dart';
import 'package:date_deck/feature/home/presentation/screen/HomePage.dart';
import 'package:date_deck/feature/home/presentation/screen/ShufflePage.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

    @override
    State<StatefulWidget> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {

    var _currentPage = 0;

    @override
    Widget build(BuildContext context) {

        final List pages = [
            HomePage(),
            ShufflePage(),
            FavoritesPage()
        ];

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
