import 'package:date_deck/DateDeckApp.dart';
import 'package:date_deck/feature/home/data/network/NetworkClient.dart';
import 'package:date_deck/feature/home/data/repo/HomeRepository.dart';
import 'package:date_deck/feature/home/domain/AddBloc/AddViewModel.dart';
import 'package:date_deck/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';

import 'feature/home/data/database/date_dao.dart';
import 'feature/home/domain/FavoriteBloc/FavoriteViewModel.dart';
import 'feature/home/domain/ShuffleBloc/ShuffleViewModel.dart';
import 'feature/login/LoginGate.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DateDao dao = await DateDeckApp.buildDatabase();
  await DateDeckApp.initFirebaseAuth();

  //Dependency injection - Dependencies are created here and injected into Bloc Cubits which is then injected to the main App
  runApp(
    MultiBlocProvider(
      providers: [
        Provider(create: (context) => NetworkClient(client: Client())),
        Provider(
          create: (context) =>
              HomeRepository(dao: dao, networkClient: Provider.of<NetworkClient>(context, listen: false)),
        ),
        BlocProvider(
          create: (context) => ShuffleViewModel(homeRepo: Provider.of<HomeRepository>(context, listen: false)),
        ),
        BlocProvider(
          create: (context) => FavoriteViewModel(homeRepo: Provider.of<HomeRepository>(context, listen: false)),
        ),
        BlocProvider(create: (context) => AddViewModel(homeRepo: Provider.of<HomeRepository>(context, listen: false))),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Date Deck',
        theme: MaterialTheme(TextTheme()).light(),
        home: LoginGate()
    );
  }
}
