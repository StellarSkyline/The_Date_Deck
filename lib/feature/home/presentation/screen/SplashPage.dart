import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import '../../domain/HomeViewModel.dart';
import 'HomeScreen.dart';

class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();

    Timer(Duration(seconds: 1), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    final vm = context.watch<HomeViewModel>();
    vm.init();

    return Container(
      color: Color(0xFFF4F4F4),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xFFF4F4F4),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset('assets/images/img_splash.png', width: 350, height: 500, fit: BoxFit.contain),
              Text(
                "The Random Date Idea Generator",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 20, color: Color(0xFF5E4E81)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
