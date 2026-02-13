import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class EmptyHandler extends StatelessWidget {
  final String textTitle;

  const EmptyHandler({super.key, required this.textTitle});

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Text(
              textTitle,
              textAlign: TextAlign.center,
              style: TextStyle(color: colorScheme.onSurface, fontSize: 30),
            ),
          ),
        ),
      ],
    );
  }
}
