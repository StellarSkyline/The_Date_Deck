import 'package:flutter/material.dart';

class GlowBackground extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // 1. Base Navy Gradient
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(begin: Alignment.topCenter, end: Alignment.bottomCenter, colors: [Color(0xFF040e24), Color(0xFF061525)]),
            ),
          ),

          // 2. Cyan Glow Blob (Top Right)
          Align(
            alignment: Alignment(1.5, -1), // x and y coordinates
            child: Container(
              width: 250,
              height: 250,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Colors.cyan.withOpacity(0.35), // Visible inner glow
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),

          // 3. Blue Glow Blob (Bottom Right)
          Align(
            alignment: Alignment(-2, 1.2),
            child: Container(
              width: 300,
              height: 300,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: RadialGradient(
                  colors: [
                    Colors.blue.withOpacity(0.3), // Visible inner glow
                    Colors.transparent,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
