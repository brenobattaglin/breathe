import 'dart:math';
import 'package:flutter/material.dart';

class LotusWidget extends StatefulWidget {
  const LotusWidget({Key? key}) : super(key: key);

  @override
  State<LotusWidget> createState() => _LotusWidgetState();
}

class _LotusWidgetState extends State<LotusWidget> {
  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _painter(),
    );
  }
}

class _painter extends CustomPainter {
  final Animation<double> animation;
  final Color color;
  final int count = 6;
  final Paint circlePaint = Paint()
    ..color = Colors.purple
    ..blendMode = BlendMode.modulate;

  _painter(
    this.animation,
    this.color,
  ) : super(repaint: animation);

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = (size.shortestSide * 0.25) * animation.value;
    for (var i = 0; i < count; i++) {
      final indexAngle = (i * pi / count * 2);
      final angle = indexAngle + (pi * 1.5 * animation.value);
      final offset = Offset(sin(angle), cos(angle)) * radius * 0.985;
      canvas.drawCircle(center + (offset * animation.value), radius, circlePaint);
    }
  }

  @override
  bool shouldRepaint(_painter oldDelegate) {
    return animation != oldDelegate.animation;
  }
}
