import 'package:date_deck/feature/home/domain/AccountViewModel.dart';
import 'package:date_deck/feature/home/presentation/components/PopupDialogHelper.dart';
import 'package:date_deck/feature/login/LoginGate.dart';
import 'package:date_deck/helpers/AuthHelper.dart';
import 'package:date_deck/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<AccountViewModel>();
    final settings = ['Password Reset', 'Sign Out'];

    return Scaffold(
      body: BlocBuilder<AccountViewModel, AccountState>(
        builder: (context, state) {
          return state.isLoading
              ? Align(
                  alignment: Alignment.center,
                  child: SizedBox(width: 100, height: 100, child: CircularProgressIndicator()),
                )
              : Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 400,
                        height: 250,
                        decoration: BoxDecoration(
                          color: Color(0x1A4E81EE),
                          borderRadius: BorderRadius.circular(15),
                          border: Border.all(color: Color(0xFF4E81EE), width: 1.0),
                        ),
                        child: Column(
                          children: [
                            SizedBox(height: 15),
                            Icon(Icons.account_circle, size: 70, color: Colors.white),
                            Text(
                              'Logged in as: ',
                              textAlign: TextAlign.start,
                              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
                            ),
                            Text(
                              '${AuthHelper.user?.email}',
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 15, color: Color(0xFF949AA6)),
                            ),
                            SizedBox(height: 15),
                            Image.asset('assets/images/img_dark_mode_logo.png', width: 75, height: 75, fit: BoxFit.contain),
                          ],
                        ),
                      ),

                      SizedBox(height: 15),

                      Padding(
                        padding: EdgeInsetsGeometry.directional(start: 5),
                        child: Text(
                          'Settings:',
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 20, color: Color(0xFF949AA6), fontWeight: FontWeight.bold),
                        ),
                      ),

                      SizedBox(height: 10),

                      Expanded(
                        child: ListView.separated(
                          itemCount: settings.length,
                          separatorBuilder: (context, index) {
                            return const SizedBox(height: 10);
                          },
                          itemBuilder: (context, index) {
                            return ListTile(
                              tileColor: Color(0x1A4E81EE),
                              title: Text(
                                settings[index],
                                style: TextStyle(fontSize: 20, color: index == 0 ? Colors.white : Colors.red, fontWeight: FontWeight.bold),
                              ),
                              subtitle: index == 0 ? Text('Send a Password Reset Link', style: TextStyle(fontSize: 15, color: Color(0xFF949AA6))) : null,
                              leading: index == 0 ? Icon(Icons.vpn_key_outlined, color: Color(0xFF4E81EE)) : Icon(Icons.logout, color: Colors.red),
                              trailing: Icon(Icons.arrow_forward_ios_outlined, color: Color(0xFF4E81EE)),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(color: Color(0xFF4E81EE), width: 0.5),
                              ),
                              onTap: () async {
                                switch (index) {
                                  case 0:
                                    {
                                      var success = await AuthHelper.resetPassword(AuthHelper.user!.email!);

                                      if (success) {
                                        if (context.mounted) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              backgroundColor: Color(0x1A4E81EE),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15),
                                                side: const BorderSide(color: Color(0xFF4E81EE), width: 0.5),
                                              ),
                                              content: Text('Password reset email sent. Check your email.', style: TextStyle(color: Colors.white, fontSize: 10)),
                                            ),
                                          );
                                        }
                                      } else {
                                        if (context.mounted) {
                                          ScaffoldMessenger.of(context).showSnackBar(
                                            SnackBar(
                                              backgroundColor: Color(0x1A4E81EE),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(15),
                                                side: const BorderSide(color: Color(0xFF4E81EE), width: 0.5),
                                              ),
                                              content: Text('Error Sending Reset Password Email', style: TextStyle(color: Colors.white, fontSize: 12)),
                                            ),
                                          );
                                        }
                                      }
                                    }

                                  case 1:
                                    {
                                      PopupDialogHelper.showCustomDialog(
                                        context: context,
                                        title: "Signing Out",
                                        description: "Signing out will delete local database cache",
                                        btn1Title: "Confirm",
                                        btn2Title: "Cancel",
                                        onPress: (value) async {
                                          switch (value) {
                                            case 0:
                                              {
                                                Navigator.of(context).pop();
                                                vm.clearDatabase();
                                                await AuthHelper.signOut();
                                                if (context.mounted) {
                                                  Navigator.of(
                                                    context,
                                                    rootNavigator: true,
                                                  ).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => const LoginGate()), (route) => false);
                                                }
                                                break;
                                              }
                                            case 1:
                                              Navigator.of(context).pop();
                                              break;
                                          }
                                        },
                                      );
                                    }
                                }
                              },
                            );
                          },
                        ),
                      ),

                      Text(
                        'Date Deck Version: $appVersion',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 12, color: Color(0xFF949AA6)),
                      ),
                    ],
                  ),
                );
        },
      ),
    );
  }
}
