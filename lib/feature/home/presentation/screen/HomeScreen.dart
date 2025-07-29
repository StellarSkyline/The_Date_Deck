import 'package:date_deck/feature/home/presentation/screen/HomePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {

    @override
    State<StatefulWidget> createState() => _HomeScreenState();

}

class _HomeScreenState extends State<HomeScreen> {
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
            body: HomePage(),

        )
        );
    }

}
