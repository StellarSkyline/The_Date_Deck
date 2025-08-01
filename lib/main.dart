import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'feature/home/domain/HomeViewModel.dart';
import 'feature/home/presentation/screen/HomeScreen.dart';

void main() {
    runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
    @override
    Widget build(BuildContext context) {
        return MultiProvider(providers: [
                ChangeNotifierProvider(create: (context) {
                    final vm = HomeViewModel();
                    vm.init();
                    return vm;
                })
            ],
            child:
            MaterialApp(
                title: 'Flutter Demo',
                theme: ThemeData(
                    colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple)
                ),
                home: HomeScreen()
            )
        );
    }
}
