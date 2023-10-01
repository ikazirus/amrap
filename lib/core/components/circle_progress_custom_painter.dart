import 'dart:math';

import 'package:flutter/material.dart';

class CircleProgressPainter extends CustomPainter {
  final double currentProgress;
  final Color color;
  final Gradient gradient;
  final double strokeWidth;

  CircleProgressPainter(
      {required this.gradient,
      required this.color,
      required this.currentProgress,
      this.strokeWidth = 8});

  @override
  void paint(Canvas canvas, Size size) {
    double centerX = size.width / 2;
    double centerY = size.height / 2;
    Offset center = Offset(centerX, centerY);
    double radius = min(centerX, centerY);

    var colShader = gradient.createShader(Rect.fromCenter(
        center: center, width: size.width, height: size.height));

    //this is base circle
    Paint centerCircleBrush = Paint()
      ..color = color.withOpacity(0.1)
      ..style = PaintingStyle.fill;

    Paint dashBrush = Paint()
      ..strokeWidth = 1
      ..shader = colShader
      ..style = PaintingStyle.stroke;

    Paint progressBrush = Paint()
      ..strokeWidth = strokeWidth
      ..shader = colShader
      ..style = PaintingStyle.stroke
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(
      center,
      radius - strokeWidth - 4,
      centerCircleBrush,
    );
    double angle = 0;

    angle = 2 * pi * (currentProgress / 100);

    var outerCircleRadius = radius + strokeWidth / 2 - 1;
    var innerCircleRadius = radius - strokeWidth / 2 + 1;
    for (double i = 0; i < 360; i += 6) {
      var x1 = centerX + outerCircleRadius * cos(i * pi / 180);
      var y1 = centerY + outerCircleRadius * sin(i * pi / 180);

      var x2 = centerX + innerCircleRadius * cos(i * pi / 180);
      var y2 = centerY + innerCircleRadius * sin(i * pi / 180);
      canvas.drawLine(Offset(x1, y1), Offset(x2, y2), dashBrush);
    }

    canvas.drawArc(Rect.fromCircle(center: center, radius: radius), -pi / 2,
        angle, false, progressBrush);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }
}
