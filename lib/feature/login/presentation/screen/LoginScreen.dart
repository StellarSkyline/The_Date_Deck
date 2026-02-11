import 'package:date_deck/feature/login/domain/LoginBloc/LoginViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final vm = context.read<LoginViewModel>();
    return Scaffold(
      body: Center(
        child: Text('Login Screen'),
      ),
    );
  }
}