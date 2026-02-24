import 'package:date_deck/feature/login/AuthHelper.dart';
import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<StatefulWidget> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  final controller = TextEditingController();
  var email = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xFFF4F4F4),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.surface),
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: Padding(
            padding: EdgeInsetsGeometry.all(32),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Logged in as: ${AuthHelper.user?.email}',
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),

                SizedBox(height: 20),

                TextField(
                  minLines: 1,
                  controller: controller,
                  decoration: InputDecoration(labelText: 'Reset Password Email', border: OutlineInputBorder()),
                  textInputAction: TextInputAction.go,
                  onSubmitted: (value ){
                    AuthHelper.resetPassword(controller.text);
                  },
                ),
                ElevatedButton(
                  onPressed: () async {
                    var success = await AuthHelper.resetPassword(controller.text);
                    if (success) {
                      if (context.mounted) {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(const SnackBar(content: Text('Password reset email sent. Check your email.')));
                      }
                    } else {
                      if (context.mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Error sending password reset email. Please check the email address and try again.',
                            ),
                          ),
                        );
                      }
                    }
                  },
                  child: Text('Reset Password'),
                ),
                ElevatedButton(onPressed: () => AuthHelper.signOut(), child: Text('Sign Out')),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
