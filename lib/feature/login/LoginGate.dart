import 'package:date_deck/feature/login/AuthHelper.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';

import '../home/presentation/screen/HomeScreen.dart';

class LoginGate extends StatelessWidget {
  const LoginGate({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: AuthHelper.auth.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomeScreen();
        } else {
          return SignInScreen(
            providers: [EmailAuthProvider()],
            headerBuilder: (context, constraints, shrinkOffset) {
              return Image.asset('assets/images/img_splash.png', width: 350, height: 500, fit: BoxFit.contain);
            },
          );
        }
      },
    );
  }
}
