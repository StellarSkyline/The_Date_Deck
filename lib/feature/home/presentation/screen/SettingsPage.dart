import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: _signOut,
      ),
      body: Center(
        child: Text("Settings Page"),
      ),
    );
  }

  Future<void> _signOut() async {
    try {
      await FirebaseAuth.instance.signOut();
      // User is signed out. The app's state management should handle
      // navigation (e.g., show the login page).
    } on FirebaseAuthException catch (e) {
      // Handle any potential errors
      print("Sign out error: ${e.message}");
    }
  }
}