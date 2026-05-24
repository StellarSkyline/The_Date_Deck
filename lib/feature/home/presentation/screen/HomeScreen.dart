import 'package:date_deck/feature/home/domain/HomeViewModel.dart';
import 'package:date_deck/feature/home/presentation/components/BottomNav.dart';
import 'package:date_deck/feature/home/presentation/screen/AccountPage.dart';
import 'package:date_deck/feature/home/presentation/screen/AddDatePage.dart';
import 'package:date_deck/feature/home/presentation/screen/FavoritesPage.dart';
import 'package:date_deck/feature/home/presentation/screen/ShufflePage.dart';
import 'package:date_deck/helpers/ConnectivityHelper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var _currentPage = 0;

  @override
  void initState() {
    super.initState();
    ConnectivityHelper.onConnectivityChanged.listen((isOnline) {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    final List pages = [ShufflePage(), FavoritesPage(), AddDatePage(), AccountPage()];
    final colorScheme = Theme.of(context).colorScheme;
    final vm = context.read<HomeViewModel>();

    if (!ConnectivityHelper.isOnline) {
      pages.removeAt(2);
    }

    return Scaffold(
      backgroundColor: colorScheme.surface,
        appBar: AppBar(
          actions: [IconButton(onPressed: () => vm.refreshAllDates(), icon: const Icon(Icons.refresh))],
        ),
      bottomNavigationBar: BottomNav(
        onPressed: (index) => {
          setState(() {
            _currentPage = index;
          }),
        },
      ),
        body:
        BlocBuilder<HomeViewModel, HomeState>(
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
