import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../data/model/category.dart';
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
                streamController = vm.streamControllerFavorites;
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
                            initialData: vm.initialFavoritesDate,
                            builder: (_, asyncSnapshot) {
                                final dates = asyncSnapshot.data ?? List.empty();
                                return ListView.builder(
                                    itemCount: dates.length,
                                    itemBuilder: (context, index) {
                                        return CardComponent(
                                            name: dates[index].fullDescription,
                                            suit: dates[index].suit,
                                            favorite: dates[index].favorite == 2,
                                            onPress: (value) => {
                                                setState(() {

                                                    }
                                                ),
                                                dates[index].favorite == 0 ? dates[index].favorite = 2 : dates[index].favorite = 0,
                                                vm.dao.updateDate(dates[index]),
                                                vm.changeStreamDataCategory(Category.Active),
                                                vm.changeStreamDataFavorites()
                                            }
                                        );
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
