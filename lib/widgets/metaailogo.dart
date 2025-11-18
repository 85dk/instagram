import 'package:flutter/material.dart';

class Metaailogo extends StatelessWidget {
  final double size;

  const Metaailogo({super.key, this.size = 10});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            Color(0xFF0064FF), // Meta Blue
                Color(0xFF00C6FB),
                 Color(0xFF005BEA),
                  Color(0xFFB400FF),
                  Color(0xFF8A2BE2),
    //                 Color(0xFF0064FF), // Meta Blue
    // Color(0xFF8A2BE2), // Electric Purple
    // Color(0xFFB400FF), // Neon Purple
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      child: Center(
        child: Container(
          height: size * 0.72,
          width: size * 0.72,
          decoration: BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: ShaderMask(
              shaderCallback: (Rect bounds) {
                return const LinearGradient(
                  colors: [
                    Color(0xFF00C6FB),
                    Color(0xFF005BEA),
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ).createShader(bounds);
              },
              child: Text(
                "",
                style: TextStyle(
                  fontSize: size * 0.32,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
