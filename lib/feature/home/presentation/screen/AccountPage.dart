import 'package:date_deck/feature/home/domain/AccountViewModel.dart';
import 'package:date_deck/feature/login/AuthHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({super.key});

  @override
  State<StatefulWidget> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    final vm = context.read<AccountViewModel>();
    return Container(
      color: Color(0xFFF4F4F4),
      child: SafeArea(
        child: Scaffold(
          appBar: AppBar(backgroundColor: Theme.of(context).colorScheme.surface),
          backgroundColor: Theme.of(context).colorScheme.surface,
          body: Padding(
            padding: EdgeInsetsGeometry.all(32),
            child: BlocBuilder<AccountViewModel, AccountState>(
              builder: (context, state) {
                return state.isLoading
                    ? Align(
                        alignment: Alignment.center,
                        child: SizedBox(width: 100, height: 100, child: CircularProgressIndicator()),
                      )
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Logged in as: ${AuthHelper.user?.email}',
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 20),
                          ElevatedButton(
                            onPressed: () async {
                              var success = await AuthHelper.resetPassword(AuthHelper.user!.email!);
                              if (success) {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Password reset email sent. Check your email.')));
                                }
                              } else {
                                if (context.mounted) {
                                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Error sending password reset email.')));
                                }
                              }
                            },
                            child: Text('Reset Password'),
                          ),
                          ElevatedButton(
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: Text('Confirm Sign out'),
                                    content: Text('All locally saved dates will be lost when signed out'),
                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () {
                                          vm.clearDatabase();
                                          AuthHelper.signOut();
                                          Navigator.pop(context);
                                        },
                                        child: Text('Confirm!'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Text('Sign Out'),
                          ),
                        ],
                      );
              },
            ),
          ),
        ),
      ),
    );
  }
}
