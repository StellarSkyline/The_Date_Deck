import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'feature/home/presentation/screen/HomeScreen.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return Container(
            color: colorScheme.surface,
            child: SafeArea(
              child: Scaffold(
                body: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Image.asset('assets/images/img_splash.png', width: 350, height: 500, fit: BoxFit.contain),
                    Text(
                      "The Random Date Idea Generator",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 20, color: colorScheme.onSurface),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
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
