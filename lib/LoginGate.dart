import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:firebase_ui_oauth_google/firebase_ui_oauth_google.dart';
import 'package:flutter/material.dart';
import 'feature/home/presentation/screen/HomeScreen.dart';

class LoginGate extends StatelessWidget {
  const LoginGate({super.key});

  final clientId = "675705772951-0mlnlt62f2desin9jchvufemgtsp6m79.apps.googleusercontent.com";

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return HomeScreen();
        } else {
          return SignInScreen(
            providers: [
              EmailAuthProvider(),
              GoogleProvider(clientId: clientId),
            ],
            headerBuilder: (context, constraints, shrinkOffset) {
              return Image.asset('assets/images/img_splash.png', width: 350, height: 500, fit: BoxFit.contain);
            },
          );
        }
      },
    );
  }
}
