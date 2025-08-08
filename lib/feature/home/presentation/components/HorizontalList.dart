import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../domain/HomeViewModel.dart';

class HorizontalList extends StatefulWidget {
    final ValueChanged<int> onPressed;

    const HorizontalList({super.key, required this.onPressed});

    @override
    State<StatefulWidget> createState() => _HorizontalListState();

}

class _HorizontalListState extends State<HorizontalList> {
    final List items = ["Active", "Creative", "Games", "Cooking"];

    @override
    Widget build(BuildContext context) {
        final vm = context.watch<HomeViewModel>();

        return ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: items.length,
            itemBuilder: (context, index) {
                return Padding(padding: EdgeInsetsGeometry.all(5.0),
                    child: ElevatedButton(
                        onPressed: () => {
                            widget.onPressed(index),
                            vm.setCategoryIndex(index)
                        },
                        style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                            backgroundColor: vm.categoryIndex == index ? Color(0xFFE06F7C) : Color(0xFF5E4E81)),
                        child: Text(items[index],
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15.0
                            )
                        )
                    )
                );
            }
        );
    }

}
