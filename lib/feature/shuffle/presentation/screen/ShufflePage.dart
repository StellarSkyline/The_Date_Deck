import 'package:date_deck/feature/shuffle/presentation/components/HorizontalList.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ShufflePage extends StatefulWidget {
    @override
    State<StatefulWidget> createState() => _ShufflePageState();

}

class _ShufflePageState extends State<ShufflePage>{

    @override
    Widget build(BuildContext context) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
                SizedBox(height: 8),
                Container(height: 42, child: HorizontalList(onPressed: (index) => {})),
                SizedBox(height: 300, width: 300, child: Placeholder())
            ]
        );
    }

}

