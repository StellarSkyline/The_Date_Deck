import 'dart:async';

import 'package:date_deck/feature/home/data/model/category.dart';
import 'package:date_deck/feature/home/presentation/components/HorizontalList.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/HomeViewModel.dart';
import '../components/CardComponent.dart';

class ShufflePage extends StatefulWidget {

    @override
    State<StatefulWidget> createState() => _ShufflePageState();

}

class _ShufflePageState extends State<ShufflePage> {
    var _currentCategory = 0;
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
                Container(height: 42, child: HorizontalList(onPressed: (index) =>
                        {
                            setState(() {
                                    _currentCategory = index;
                                }
                            ),
                            vm.changeStreamDataCategory(Category.values[_currentCategory])
                        }
                    )),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: StreamBuilder(
                            stream: streamController.stream,
                            initialData: vm.initialShuffleDate,
                            builder: (_, asyncSnapshot) {
                                final dates = asyncSnapshot.data ?? List.empty();
                                return ListView.builder(
                                    itemCount: 4,
                                    itemBuilder: (context, index) {
                                        return CardComponent(
                                            name: dates[index].fullDescription,
                                            suit: dates[index].suit,
                                            favorite: dates[index].favorite,
                                            onPress: (value) => {
                                                setState(() {

                                                }),
                                                dates[index].favorite = !dates[index].favorite,
                                                vm.dao.updateDate(dates[index]),
                                            },
                                        );
                                    }
                                );
                            }
                        )
                    )
                ),
                Center(
                    child: SizedBox(
                        width: 228,
                        height: 55,
                        child: ElevatedButton(
                            onPressed: () =>
                            {
                                vm.changeStreamDataCategory(Category.values[_currentCategory])
                            },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xFFE06F7C),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10))
                            ),
                            child: Text("Shuffle Deck",
                                style: TextStyle(color: Colors.white, fontSize: 16))
                        )
                    )
                ),
                SizedBox(height: 8)
            ]
        );
    }
}

