import 'package:flutter/cupertino.dart';

class EmptyHandler extends StatelessWidget {
    final String textTitle;
    const EmptyHandler({required this.textTitle});

    @override
    Widget build(BuildContext context) {
        return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
                Padding(
                    padding: EdgeInsets.all(10),
                    child: Center(
                        child:
                        Text(
                            textTitle,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Color(0xFF5E4E81),
                                fontSize: 30
                            )
                        )
                    )
                )
            ]
        );
    }
}

