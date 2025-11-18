import 'package:flutter/material.dart';

class InstagramReelsIcon extends StatelessWidget {
  final double size;
  final Color color;

  const InstagramReelsIcon({
    Key? key,
    this.size = 48.0,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size(size, size),
      painter: _ReelsIconPainter(color),
    );
  }
}

class _ReelsIconPainter extends CustomPainter {
  final Color color;
  _ReelsIconPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..style = PaintingStyle.stroke
      ..strokeWidth = size.width * 0.07
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    // Outer rounded rectangle (camera body)
    final rect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, size.width, size.height),
      Radius.circular(size.width * 0.25),
    );
    canvas.drawRRect(rect, paint);

    // 🔺 Slightly larger play triangle in the middle (about +2px)
    final extra = 2.0 / size.width; // scale factor for 2px offset
    final path = Path();
    path.moveTo(size.width * (0.4 - extra), size.height * (0.35 - extra));
    path.lineTo(size.width * (0.7 + extra), size.height * 0.5);
    path.lineTo(size.width * (0.4 - extra), size.height * (0.65 + extra));
    path.close();

    final playPaint = Paint()
      ..color = color
      ..style = PaintingStyle.fill;
    canvas.drawPath(path, playPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
