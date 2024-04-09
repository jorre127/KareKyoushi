import 'package:flutter/material.dart';

class DropPainter extends CustomPainter {
  final Color color;
  final bool showDrop;

  DropPainter(
    this.color,
    this.showDrop,
  );

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = color
      ..strokeWidth = 2;

    final circleCenter = Offset(size.width, size.height) / 2;
    final rectangleCenter = Offset(size.width / 2, size.height);
    final radius = size.width / 2;
    canvas.drawCircle(circleCenter, size.width / 2, paint);
    if (showDrop) {
      canvas.drawRect(
        Rect.fromCircle(
          center: rectangleCenter,
          radius: radius,
        ),
        paint,
      );

      final path = Path();
      path.moveTo(0, size.height / 2);
      path.lineTo(0, size.height + 8);
      path.lineTo(-(size.width / 2), size.height + 8);
      path.cubicTo(
        -(size.width / 4),
        size.height + 8,
        0,
        (size.height - (size.height / 10)),
        0,
        size.height / 2,
      );
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
