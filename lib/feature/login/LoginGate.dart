import 'package:date_deck/feature/home/domain/HomeViewModel.dart';
import 'package:date_deck/feature/home/presentation/components/GlowBackground.dart';
import 'package:date_deck/helpers/AuthHelper.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../home/presentation/screen/HomeScreen.dart';

class LoginGate extends StatelessWidget {
  const LoginGate({super.key});

  @override
  Widget build(BuildContext context) {
    final vm = context.read<HomeViewModel>();

    return Stack(
      children: [
        GlowBackground(),
        StreamBuilder(
          stream: AuthHelper.auth.authStateChanges(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return FutureBuilder(
                future: vm.refreshAllDates(),
                builder: (context, preloadSnapshot) {
                  if (preloadSnapshot.connectionState == ConnectionState.waiting) {
                    return const Scaffold(body: Center(child: CircularProgressIndicator()));
                  }

                  if (preloadSnapshot.hasError) {
                    return Scaffold(body: Center(child: Text('Failed to load data: ${preloadSnapshot.error}')));
                  }

                  return HomeScreen();
                },
              );
            }

            return SignInScreen(
              providers: [EmailAuthProvider()],
              headerBuilder: (context, constraints, shrinkOffset) {
                return Image.asset('assets/images/img_dark_mode_logo.png', width: 350, height: 500, fit: BoxFit.contain);
              },
              actions: [
                AuthStateChangeAction<SignedIn>((context, state) async {
                  await vm.refreshAllDates();
                }),
              ],
            );
          },
        ),
      ],
    );
  }
}
