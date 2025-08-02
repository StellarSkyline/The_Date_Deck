import 'package:date_deck/feature/home/data/model/category.dart';
import 'package:date_deck/feature/home/presentation/components/HorizontalList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/HomeViewModel.dart';

class ShufflePage extends StatefulWidget {

    @override
    State<StatefulWidget> createState() => _ShufflePageState();

}

class _ShufflePageState extends State<ShufflePage>{
    var _currentCategory = 0;

    @override
    Widget build(BuildContext context) {
        final vm = context.watch<HomeViewModel>();

        return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                SizedBox(height: 8),
                Container(height: 42, child: HorizontalList(onPressed: (index) => {
                  setState(() {
                    _currentCategory = index;
                  }),
                  vm.changeStreamData(Category.values[_currentCategory])
                })),
                Expanded(
                    child: Padding(
                        padding: EdgeInsets.all(10),
                        child: StreamBuilder(
                            stream: vm.streamController.stream,
                            initialData: vm.test,
                            builder: (_, asyncSnapshot) {
                                final dates = asyncSnapshot.data ?? List.empty();
                                return ListView.builder(
                                    itemCount: dates.length,
                                    //Add Item Count here
                                    itemBuilder: (context, index) {
                                        return Text(dates[index].fullDescription,
                                            style: TextStyle(
                                                fontSize: 16, color: Colors.black));
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
                            onPressed: () => {},
                            style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                backgroundColor: Color(0xFFE06F7C)
                            ),
                            child: Text("Shuffle Deck", style: TextStyle(color: Colors.white, fontSize: 16))
                        )
                    )
                ),
                SizedBox(height: 8)
            ]
        );
    }

}


