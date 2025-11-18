import 'package:flutter/material.dart';

class HighlightCircle extends StatelessWidget {
  final String label;
  final String imagePath;
  final bool useGradientBorder;
  final double size;

  const HighlightCircle({
    Key? key,
    required this.label,
    required this.imagePath,
    this.useGradientBorder = false,
    this.size = 80,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final bool isNetwork = imagePath.startsWith('http');
    final double boderthickness=3;
    final double whitgap=3;
    return Column(
      children: [
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            gradient: useGradientBorder
                ? const LinearGradient(
                    colors: [
                      Color(0xFFFEDA75), // yellow
                      Color(0xFFFA7E1E), // orange
                      Color(0xFFD62976), // pink
                      Color(0xFF962FBF), // purple
                      Color(0xFF4F5BD5), // blue
                    ],
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                  )
                : null,
            border: useGradientBorder
                ? null
                : Border.all(color: Colors.transparent, width: 2),
          ),
          child: Padding(
            padding: const EdgeInsets.all(3.0),
            child: Container(
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: Padding(
                padding: const EdgeInsets.all(3.0),
                child: ClipOval(
                  child: isNetwork
                      ? Image.network(imagePath, fit: BoxFit.cover)
                      : Image.asset(imagePath, fit: BoxFit.cover),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 3),
        Text(
          label,
           overflow: TextOverflow.ellipsis,
          style: const TextStyle(
            fontSize: 9,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
