import 'package:flutter/material.dart';

class RepostIcon extends StatelessWidget {
  final double size;
  final Color color;

  const RepostIcon({
    Key? key,
    this.size = 24.0,
    this.color = Colors.black,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: Size.square(size),
      painter: _RepostPainter(color),
    );
  }
}

class _RepostPainter extends CustomPainter {
  final Color color;
  _RepostPainter(this.color);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = size.width * 0.08
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    final arrowPath1 = Path();
    final arrowPath2 = Path();

    // Top arrow (pointing right)
    arrowPath1.moveTo(size.width * 0.1, size.height * 0.35);
    arrowPath1.lineTo(size.width * 0.7, size.height * 0.35);
    arrowPath1.lineTo(size.width * 0.6, size.height * 0.25);
    arrowPath1.moveTo(size.width * 0.7, size.height * 0.35);
    arrowPath1.lineTo(size.width * 0.6, size.height * 0.45);

    // Bottom arrow (pointing left)
    arrowPath2.moveTo(size.width * 0.9, size.height * 0.65);
    arrowPath2.lineTo(size.width * 0.3, size.height * 0.65);
    arrowPath2.lineTo(size.width * 0.4, size.height * 0.55);
    arrowPath2.moveTo(size.width * 0.3, size.height * 0.65);
    arrowPath2.lineTo(size.width * 0.4, size.height * 0.75);

    canvas.drawPath(arrowPath1, paint);
    canvas.drawPath(arrowPath2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
