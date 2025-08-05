import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {

        return Center(
            child: Column(
                spacing: 30,
                children: [
                    SizedBox(height: 30),
                    SvgPicture.asset('assets/images/img_main.svg',
                        width: 306,
                        height: 447),
                    Text("The\nRandom \nDate Generator",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 24
                        ))
                ]
            )
        );
    }
}
