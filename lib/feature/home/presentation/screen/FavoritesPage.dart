import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/HomeViewModel.dart';
import '../components/CardComponent.dart';

class FavoritesPage extends StatefulWidget{
    @override
    State<StatefulWidget> createState() => _FavoritesPageState();

}

class _FavoritesPageState extends State<FavoritesPage>{

    //Widget State
    var streamController = StreamController();

    @override
    Widget build(BuildContext context) {
        final vm = context.watch<HomeViewModel>();
        setState(() {
                streamController = vm.streamController;
            }
        );
        return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                SizedBox(height: 8),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: StreamBuilder(
                            stream: streamController.stream,
                            initialData: vm.initialDates,
                            builder: (_, asyncSnapshot) {
                                final dates = asyncSnapshot.data ?? List.empty();
                                return ListView.builder(
                                    itemCount: dates.length,
                                    //Add Item Count here
                                    itemBuilder: (context, index) {
                                        return CardComponent(
                                            name: dates[index].fullDescription,
                                            suit: dates[index].suit,
                                            onPress: (index) => {});
                                    }
                                );
                            }
                        )
                    )
                ),
                SizedBox(height: 8)
            ]
        );
    }

}
