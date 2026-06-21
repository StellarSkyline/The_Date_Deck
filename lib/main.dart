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

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const AppBootstrap());
}

class AppBootstrap extends StatefulWidget {
  const AppBootstrap({super.key});

  @override
  State<AppBootstrap> createState() => _AppBootstrapState();
}

class _AppBootstrapState extends State<AppBootstrap> {
  bool _isInitialized = false;
  late DateDao _dao;
  late bool _isLoggedIn;

  @override
  void initState() {
    super.initState();
    _initApp();
  }

  Future<void> _initApp() async {
    final results = await Future.wait([
      DateDeckApp.buildDatabase(),
      DateDeckApp.initFirebaseAuth(),
      SharedPreferences.getInstance(),
      ConnectivityHelper.initialize(),
      PackageInfo.fromPlatform(),
    ]);

    _dao = results[0] as DateDao;
    final SharedPreferences prefs = results[2] as SharedPreferences;
    final PackageInfo packageInfo = results[4] as PackageInfo;

    AuthHelper.listenToAuthChanges();
    _isLoggedIn = prefs.getBool('is_logged_in') ?? false;
    appVersion = packageInfo.version;

    if (mounted) {
      setState(() {
        _isInitialized = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    if (!_isInitialized) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          brightness: Brightness.dark,
          scaffoldBackgroundColor: const Color(0xFF0D2240),
        ),
        home: const Scaffold(
          body: Center(
            child: CircularProgressIndicator(color: Color(0xFF4E81EE)),
          ),
        ),
      );
    }

    return MultiBlocProvider(
      providers: [
        Provider(create: (context) => NetworkClient(client: Client())),
        Provider(
          create: (context) => HomeRepository(dao: _dao, networkClient: Provider.of<NetworkClient>(context, listen: false)),
        ),
        BlocProvider(create: (context) => ShuffleViewModel(homeRepo: Provider.of<HomeRepository>(context, listen: false))),
        BlocProvider(create: (context) => FavoriteViewModel(homeRepo: Provider.of<HomeRepository>(context, listen: false))),
        BlocProvider(create: (context) => AddViewModel(homeRepo: Provider.of<HomeRepository>(context, listen: false))),
        BlocProvider(create: (context) => AccountViewModel(homeRepo: Provider.of<HomeRepository>(context, listen: false))),
        BlocProvider(create: (context) => HomeViewModel(homeRepo: Provider.of<HomeRepository>(context, listen: false))),
      ],
      child: MyApp(isLoggedIn: _isLoggedIn),
    );
  }
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;

  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Date Deck',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: MaterialTheme.darkScheme().copyWith(surface: const Color(0xFF0D2240)),
        scaffoldBackgroundColor: const Color(0xFF0D2240),
      ),
      home: isLoggedIn ? const HomeScreen() : const LoginGate(),
    );
  }
}
