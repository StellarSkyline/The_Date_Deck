import 'package:firebase_auth/firebase_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthHelper {
  //Firebase Auth functions are handled here for better separation of concerns and to avoid bloating the UI code with auth logic
  static final auth = FirebaseAuth.instance;
  static final user = auth.currentUser;

  static Future<void> signOut() async {
    await auth.signOut();
  }

  static Future<bool> resetPassword(String email) async {
    print('Attempting to send password reset email to: $email');
    try {
      await auth.sendPasswordResetEmail(email: email);
      return true;
    } on FirebaseAuthException {
      return false;
    }
  }

  static void listenToAuthChanges() {
    auth.authStateChanges().listen((User? user) async {
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      if (user != null) {
        // User is signed in, save their ID or a boolean flag
        await prefs.setString('user_id', user.uid);
        await prefs.setBool('is_logged_in', true);
      } else {
        // User is signed out, clear the data
        await prefs.remove('user_id');
        await prefs.setBool('is_logged_in', false);
      }
    });
  }
}
