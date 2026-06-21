import 'package:date_deck/DateDeckApp.dart';
import 'package:date_deck/feature/home/data/network/NetworkClient.dart';
import 'package:date_deck/feature/home/data/repo/HomeRepository.dart';
import 'package:date_deck/feature/home/domain/AccountViewModel.dart';
import 'package:date_deck/feature/home/domain/AddViewModel.dart';
import 'package:date_deck/feature/home/domain/HomeViewModel.dart';
import 'package:date_deck/helpers/AuthHelper.dart';
import 'package:date_deck/helpers/ConnectivityHelper.dart';
import 'package:date_deck/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'feature/home/data/database/date_dao.dart';
import 'feature/home/domain/FavoriteViewModel.dart';
import 'feature/home/domain/ShuffleViewModel.dart';
import 'feature/home/presentation/screen/HomeScreen.dart';
import 'feature/login/LoginGate.dart';

String appVersion = '';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DateDao dao = await DateDeckApp.buildDatabase();
  await DateDeckApp.initFirebaseAuth();
  AuthHelper.listenToAuthChanges();
  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final bool isLoggedIn = prefs.getBool('is_logged_in') ?? false;
  await ConnectivityHelper.initialize();
  PackageInfo packageInfo = await PackageInfo.fromPlatform();
  appVersion = packageInfo.version;

  //Dependency injection - Dependencies are created here and injected into Bloc Cubits which is then injected to the main App
  runApp(
    MultiBlocProvider(
      providers: [
        Provider(create: (context) => NetworkClient(client: Client())),
        Provider(
          create: (context) => HomeRepository(dao: dao, networkClient: Provider.of<NetworkClient>(context, listen: false)),
        ),
        BlocProvider(create: (context) => ShuffleViewModel(homeRepo: Provider.of<HomeRepository>(context, listen: false))),
        BlocProvider(create: (context) => FavoriteViewModel(homeRepo: Provider.of<HomeRepository>(context, listen: false))),
        BlocProvider(create: (context) => AddViewModel(homeRepo: Provider.of<HomeRepository>(context, listen: false))),
        BlocProvider(create: (context) => AccountViewModel(homeRepo: Provider.of<HomeRepository>(context, listen: false))),
        BlocProvider(create: (context) => HomeViewModel(homeRepo: Provider.of<HomeRepository>(context, listen: false))),
      ],
        child: MyApp(isLoggedIn: isLoggedIn)
    ),
  );
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Date Deck',
      theme: ThemeData(useMaterial3: true, colorScheme: MaterialTheme.darkScheme()),
      home: isLoggedIn ? HomeScreen() : LoginGate(),
    );
  }
}
