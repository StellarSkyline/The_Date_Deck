import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'feature/home/domain/HomeViewModel.dart';
import 'feature/home/presentation/screen/HomeScreen.dart';

void main() {
    runApp(
        ChangeNotifierProvider(
            create: (context) => HomeViewModel(),
            child: MyApp()
        )
    );
}

class MyApp extends StatelessWidget {
    const MyApp({super.key});
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
                colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
            ),
            home: HomeScreen()
        );
    }
}
