import 'package:date_deck/feature/home/domain/HomeViewModel.dart';
import 'package:date_deck/feature/home/presentation/components/BottomNav.dart';
import 'package:date_deck/feature/home/presentation/components/GlowBackground.dart';
import 'package:date_deck/feature/home/presentation/components/PopupDialogHelper.dart';
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
    final List title = ['Shuffle', 'Saved Dates', 'Add Date Idea', 'Account'];
    final vm = context.read<HomeViewModel>();

    if (!ConnectivityHelper.isOnline) {
      pages.removeAt(2);
    }

    return Stack(
      children: [
        GlowBackground(),

        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            title: Text(
              title[_currentPage],
              style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),
            ),
            centerTitle: false,
            actions: [
              if (_currentPage == 0)
                IconButton(
                  icon: Icon(Icons.refresh, color: Colors.white, size: 30),
                  onPressed: () {
                    //onPressed: () => vm.refreshAllDates(),
                    PopupDialogHelper.showCustomDialog(
                      context: context,
                      title: "Syncing Dates",
                      description: "Syncing Dates will refresh and delete all saved dates",
                      btn1Title: "Confirm",
                      btn2Title: "Cancel",
                      onPress: (value) {
                        switch (value) {
                          case 0:
                            {
                              Navigator.of(context).pop();
                              vm.refreshAllDates();
                            }
                          case 1:
                            {
                              Navigator.of(context).pop();
                            }
                        }
                      },
                    );
                  },
                ),
            ],
          ),

          bottomNavigationBar: BottomNav(
            onPressed: (index) => {
              setState(() {
                _currentPage = index;
              }),
            },
          ),

          body: BlocBuilder<HomeViewModel, HomeState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(child: CircularProgressIndicator());
              } else {
                return SafeArea(child: pages[_currentPage]);
              }
            },
          ),
        ),
      ],
    );
  }

  @override
  void dispose() {
    super.dispose();
  }
}
