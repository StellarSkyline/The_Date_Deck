import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CardComponent extends StatelessWidget {
    @override
    Widget build(BuildContext context) {
        return SizedBox(
            width: 397,
            height: 200,
            child: Card(
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
                color: Color(0xFFFBF8F0),
                child: Padding(
                    padding: EdgeInsetsGeometry.all(8.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                            Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                    Column(
                                        children: [
                                            Text("A"),
                                            SvgPicture.asset('assets/icons/icn_club.svg', color: Color(0xFF5E4E81))
                                        ]
                                    )
                                ]
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                    Expanded(
                                        child: Text(
                                            "DATE IDEA GOES HERE",
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: 15,
                                                color: Colors.black

                                            )
                                        )
                                    )
                                ]
                            ),
                            Center(
                                child:
                                SizedBox(
                                    width: 121,
                                    height: 25,
                                    child: ElevatedButton(
                                        onPressed: () => {},
                                        style: ElevatedButton.styleFrom(
                                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                            backgroundColor: Color(0xFFE06F7C)
                                        ),
                                        child: Text("Favorite",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 15.0
                                            )
                                        )
                                    )
                                )
                            ),
                            Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                    Column(
                                        children: [
                                            Text("A"),
                                            SvgPicture.asset('assets/icons/icn_club.svg', color: Color(0xFF5E4E81))
                                        ]
                                    )
                                ]
                            )

                        ]
                    )
                )
            )
        );
    }

}
