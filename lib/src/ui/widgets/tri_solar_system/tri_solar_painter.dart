import 'dart:math';
import 'package:flutter/material.dart';
import 'package:threebody/src/styles/app_theme.dart';

class TriSolarPainter extends CustomPainter {
  final double animationValue;
  final List<Offset> starPositions;

  TriSolarPainter({
    required this.animationValue,
    required this.starPositions,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.4;

    // 绘制轨道
    final orbitPaint = Paint()
      ..color = AppTheme.starBlue.withOpacity(0.3)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    canvas.drawCircle(center, radius, orbitPaint);

    // 绘制恒星
    final starPaint = Paint()
      ..color = AppTheme.starBlue
      ..style = PaintingStyle.fill
      ..maskFilter = const MaskFilter.blur(BlurStyle.normal, 8);

    for (final position in starPositions) {
      canvas.drawCircle(position, 10, starPaint);
    }
  }

  @override
  bool shouldRepaint(covariant TriSolarPainter oldDelegate) {
    return oldDelegate.animationValue != animationValue ||
        oldDelegate.starPositions != starPositions;
  }
}

class TriSolarSystem extends StatefulWidget {
  const TriSolarSystem({super.key});

  @override
  State<TriSolarSystem> createState() => _TriSolarSystemState();
}

class _TriSolarSystemState extends State<TriSolarSystem>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Offset> _starPositions;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 10),
    )..repeat();

    _starPositions = List.generate(3, (index) {
      final angle = (index * 2 * pi / 3);
      return Offset(
        100 * cos(angle),
        100 * sin(angle),
      );
    });

    _controller.addListener(_updateStarPositions);
  }

  void _updateStarPositions() {
    setState(() {
      for (int i = 0; i < _starPositions.length; i++) {
        final angle = (_controller.value * 2 * pi) + (i * 2 * pi / 3);
        final radius = 100.0 + 20 * sin(angle * 2);
        _starPositions[i] = Offset(
          radius * cos(angle),
          radius * sin(angle),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (context, child) {
        return CustomPaint(
          painter: TriSolarPainter(
            animationValue: _controller.value,
            starPositions: _starPositions,
          ),
          size: const Size(300, 300),
        );
      },
    );
  }
}