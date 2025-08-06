import 'dart:async';

import 'package:date_deck/feature/home/presentation/components/EmptyHandler.dart';
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

    var databaseState = true;

    @override
    Widget build(BuildContext context) {
        final vm = context.watch<HomeViewModel>();
        setState(() {
                streamController = vm.streamControllerFavorites;
            }
        );

        if (vm.initialFavoritesDate.isEmpty) {
            setState(() {
                    databaseState = false;
                }
            );
        }

        return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                SizedBox(height: 8),
                Expanded(
                    child: databaseState ? Padding(
                            padding: EdgeInsets.all(10),
                            child: StreamBuilder(
                                stream: streamController.stream,
                                initialData: vm.initialFavoritesDate,
                                builder: (_, asyncSnapshot) {
                                    final dates = asyncSnapshot.data ?? List.empty();
                                    return ListView.builder(
                                        itemCount: dates.length,
                                        itemBuilder: (context, index) {
                                            return CardComponent(
                                                name: dates[index].fullDescription,
                                                suit: dates[index].suit,
                                                favorite: dates[index].favorite,
                                                onPress: (value) => {
                                                    setState(() {}),
                                                    dates[index].favorite ? dates[index].favorite = false : dates[index].favorite = true,
                                                    vm.updateDate(dates[index]),
                                                    vm.changeStreamDataFavorites()
                                                }
                                            );
                                        }
                                    );
                                }
                            )
                        ) : EmptyHandler(textTitle: "Favorites is Empty")
                ),
                SizedBox(height: 8)
            ]
        );
    }

}
