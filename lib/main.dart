import 'package:date_deck/feature/home/data/network/NetworkClient.dart';
import 'package:date_deck/feature/home/data/repo/HomeRepository.dart';
import 'package:date_deck/feature/home/domain/bloc/FavoriteViewModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:provider/provider.dart';
import 'feature/home/domain/HomeViewModel.dart';
import 'feature/home/domain/bloc/ShuffleViewModel.dart';
import 'feature/home/presentation/screen/SplashPage.dart';

void main() {
  //Dependency injection - Dependencies are created here and injected into HomeViewModel which is then injected to the main App

  runApp(
    MultiBlocProvider(providers: [
      Provider(create:(context) => NetworkClient(client: Client())),
      Provider(create: (context) => HomeRepository(networkClient: Provider.of<NetworkClient>(context, listen:false))),
      ChangeNotifierProvider(create: (context) => HomeViewModel(homeRepo: Provider.of<HomeRepository>(context, listen: false))),
      BlocProvider(create: (context) => ShuffleViewModel(homeRepo: Provider.of<HomeRepository>(context, listen: false))),
      BlocProvider(create: (context) => FavoriteViewModel(homeRepo: Provider.of<HomeRepository>(context, listen: false)))
    ], child: MyApp())
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)),
      home: SplashPage(),
    );
  }
}
