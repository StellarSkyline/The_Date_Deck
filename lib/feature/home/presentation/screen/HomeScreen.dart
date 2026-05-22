import 'package:date_deck/feature/home/presentation/components/BottomNav.dart';
import 'package:date_deck/feature/home/presentation/screen/AccountPage.dart';
import 'package:date_deck/feature/home/presentation/screen/AddDatePage.dart';
import 'package:date_deck/feature/home/presentation/screen/FavoritesPage.dart';
import 'package:date_deck/feature/home/presentation/screen/ShufflePage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/LoginViewModel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final List pages = [ShufflePage(), FavoritesPage(), AddDatePage(), AccountPage()];
    final colorScheme = Theme.of(context).colorScheme;
    final vm = context.read<LoginViewModel>();

    return Scaffold(
      backgroundColor: colorScheme.surface,
        appBar: AppBar(
          actions: [IconButton(onPressed: () => vm.getAllDates(), icon: const Icon(Icons.refresh))],
        ),
      bottomNavigationBar: BottomNav(
        onPressed: (index) => {
          setState(() {
            _currentPage = index;
          }),
        },
      ),
        body:
        BlocBuilder<LoginViewModel, LoginState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return SafeArea(
                  child: pages[_currentPage],
                );
              }
            }
        )
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
