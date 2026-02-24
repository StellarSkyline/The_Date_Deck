import 'package:date_deck/feature/home/presentation/components/BottomNav.dart';
import 'package:date_deck/feature/home/presentation/screen/AddDatePage.dart';
import 'package:date_deck/feature/home/presentation/screen/FavoritesPage.dart';
import 'package:date_deck/feature/home/presentation/screen/AccountPage.dart';
import 'package:date_deck/feature/home/presentation/screen/ShufflePage.dart';
import 'package:flutter/material.dart';

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

    return Scaffold(
      backgroundColor: colorScheme.surface,
      bottomNavigationBar: BottomNav(
        onPressed: (index) => {
          setState(() {
            _currentPage = index;
          }),
        },
      ),
      body: SafeArea(
        child: pages[_currentPage],
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
