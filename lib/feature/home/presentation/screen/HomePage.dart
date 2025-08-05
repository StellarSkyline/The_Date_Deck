import 'package:flutter/cupertino.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatelessWidget {
    @override
    Widget build(BuildContext context) {

        return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                    SizedBox(height: 30),
                    SvgPicture.asset('assets/images/img_main.svg',
                        width: 350,
                        height: 500),
                ]
            )
        );
    }
}
