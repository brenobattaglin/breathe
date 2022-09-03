import 'dart:math';
import 'package:flutter/material.dart';

class LotusWidget extends StatefulWidget {
  const LotusWidget({Key? key}) : super(key: key);

  @override
  State<LotusWidget> createState() => _LotusWidgetState();
}

class _LotusWidgetState extends State<LotusWidget> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _animationController.repeat(reverse: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        height: 300,
        width: 300,
        child: CustomPaint(
          painter: _Painter(
            CurvedAnimation(
              parent: _animationController,
              curve: Curves.easeOutQuart,
              reverseCurve: Curves.easeOutQuart,
            ),
          ),
          size: Size.infinite,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}

class _Painter extends CustomPainter {
  final Animation<double> _animation;
  final int _leaves = 10;
  late final Color _color;
  late final Paint _circlePaint;

  _Painter(
    this._animation,
  ) : super(repaint: _animation) {
    _color = const Color(0xFF8FBCBB);
    _circlePaint = Paint();
    _circlePaint.color = _color;
    _circlePaint.blendMode = BlendMode.softLight;
  }

  @override
  void paint(Canvas canvas, Size size) {
    final center = size.center(Offset.zero);
    final radius = (size.shortestSide * 0.25) * _animation.value;
    for (var i = 0; i < _leaves; i++) {
      final indexAngle = (i * pi / _leaves * 2);
      final angle = indexAngle + (pi * 1.5 * _animation.value);
      final offset = Offset(sin(angle), cos(angle)) * radius * 0.985;
      canvas.drawCircle(center + (offset * _animation.value), radius, _circlePaint);
    }
  }

  @override
  bool shouldRepaint(_Painter oldDelegate) {
    return _animation != oldDelegate._animation;
  }
}
