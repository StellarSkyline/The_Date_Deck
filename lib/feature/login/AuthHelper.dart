import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
    } on FirebaseAuthException catch (e) {
      return false;
    }
  }
}
