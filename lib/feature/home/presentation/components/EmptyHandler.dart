import 'package:flutter/material.dart';

class EmptyHandler extends StatelessWidget {
  final String textTitle;
  final String textDescription;

  const EmptyHandler({super.key, required this.textTitle, required this.textDescription});

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
              child: Column(
                  children: [
                    Text(
                      textTitle,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      textDescription,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Color(0xFF949AA6), fontSize: 15),
                    ),
                  ]
              )
          ),
        ),
      ],
    );
  }
}
