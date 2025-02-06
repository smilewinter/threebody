import 'dart:math';
import 'package:flutter/material.dart';

class DarkForestPage extends StatefulWidget {
  const DarkForestPage({super.key});

  @override
  State<DarkForestPage> createState() => _DarkForestPageState();
}

class _DarkForestPageState extends State<DarkForestPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  final List<Particle> _particles = [];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 4),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.repeat();

    // 初始化粒子
    for (int i = 0; i < 50; i++) {
      _particles.add(Particle());
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('黑暗森林'),
        backgroundColor: Colors.black45,
      ),
      body: Stack(
        children: [
          AnimatedBuilder(
            animation: _animation,
            builder: (context, child) {
              return CustomPaint(
                painter: DarkForestPainter(_particles, _animation.value),
                size: Size.infinite,
              );
            },
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '黑暗森林法则',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.blue,
                        blurRadius: 10,
                        offset: Offset(0, 0),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(15),
                    border: Border.all(color: Colors.blue.withOpacity(0.3)),
                  ),
                  child: const Text(
                    '宇宙就像一片黑暗森林，每个文明都是带枪的猎人。在这个森林中，任何暴露自己的文明都将面临毁灭的危险。',
                    style: TextStyle(color: Colors.white70, fontSize: 16),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class Particle {
  double x = 0;
  double y = 0;
  double speed = 0;
  double brightness = 0;

  Particle() {
    reset();
  }

  void reset() {
    x = Random().nextDouble();
    y = Random().nextDouble();
    speed = Random().nextDouble() * 0.02 + 0.01;
    brightness = Random().nextDouble();
  }

  void update() {
    y += speed;
    if (y > 1) {
      reset();
      y = 0;
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
        ..color = Colors.white.withOpacity(particle.brightness * 0.5)
        ..strokeWidth = 2;

      canvas.drawCircle(
        Offset(particle.x * size.width, particle.y * size.height),
        1,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(DarkForestPainter oldDelegate) => true;
}