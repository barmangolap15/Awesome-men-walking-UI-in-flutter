import 'package:flutter/material.dart';

class MountainPainter extends CustomPainter {
  final double offset;

  MountainPainter(this.offset);

  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()..color = Colors.brown.shade700;
    final path1 = Path();
    path1.moveTo(0, size.height);
    path1.lineTo(size.width * 0.25 + offset, size.height * 0.5);
    path1.lineTo(size.width * 0.5 + offset, size.height);
    path1.close();
    canvas.drawPath(path1, paint1);

    final paint2 = Paint()..color = Colors.green.shade700;
    final path2 = Path();
    path2.moveTo(size.width * 0.4, size.height);
    path2.lineTo(size.width * 0.65 + offset, size.height * 0.45);
    path2.lineTo(size.width * 0.9 + offset, size.height);
    path2.close();
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(MountainPainter oldDelegate) {
    return oldDelegate.offset != offset;
  }
}
