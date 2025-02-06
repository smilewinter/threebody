import 'dart:math';
import 'package:flutter/material.dart';

class Particle {
  late double x;
  late double y;
  late double speed;
  late double size;
  late double opacity;
  final Random random = Random();

  Particle() {
    reset();
  }

  void reset() {
    x = random.nextDouble() * 400;
    y = random.nextDouble() * 800;
    speed = 1 + random.nextDouble() * 2;
    size = 1 + random.nextDouble() * 2;
    opacity = 0.3 + random.nextDouble() * 0.7;
  }

  void update() {
    y -= speed;
    if (y < 0) {
      reset();
      y = 800;
    }
  }
}

class DarkForestPainter extends CustomPainter {
  final List<Particle> particles;
  final double animationValue;

  DarkForestPainter(this.particles, this.animationValue);

  @override
  void paint(Canvas canvas, Size size) {
    for (var particle in particles) {
      particle.update();
      final paint = Paint()
        ..color = Colors.white.withOpacity(particle.opacity)
        ..style = PaintingStyle.fill;

      canvas.drawCircle(
        Offset(particle.x, particle.y),
        particle.size,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(DarkForestPainter oldDelegate) => true;
}