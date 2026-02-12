import 'package:date_deck/feature/login/AuthHelper.dart';
import 'package:flutter/material.dart';

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
        ElevatedButton(onPressed: AuthHelper.signOut, child: Text("Sign Out")),
      ],
    );
  }
}
