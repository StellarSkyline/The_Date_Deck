import 'package:date_deck/LoginGate.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

//TODO: Update Settings with User Data

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text("Settings", textAlign: TextAlign.center),
        SizedBox(height: 16),
        ElevatedButton(
          onPressed: () {
            _signOut().then((success) {
              if (success) {
                if (context.mounted) {
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginGate()));
                }
              } else {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sign out failed")));
                }
              }
            });
          },
          child: Text("Sign Out"),
        )
      ],
    );
  }

  Future<bool> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      return true;
    } on FirebaseAuthException catch (e) {
      return false;
    }
  }
}
