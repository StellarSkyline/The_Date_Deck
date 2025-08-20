import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'HomeScreen.dart';

class SplashPage extends StatefulWidget {
    @override
    State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

    @override
    void initState() {
        super.initState();

        Timer(Duration(seconds: 3), () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
            }
        );
    }

    @override
    Widget build(BuildContext context) {

        return Container(
            color: Color(0xFFF4F4F4),
            child: SafeArea(
                child: Scaffold(
                    backgroundColor: Color(0xFFF4F4F4),
                    body: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                            SvgPicture.asset('assets/images/img_main.svg',
                                width: 350,
                                height: 500
                            ),
                            Text("The Random Date Idea Generator",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 20,
                                    color: Color(0xFF5E4E81)
                                )
                            )
                        ]
                    )
                )

            )
        );
    }
}

