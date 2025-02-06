import 'dart:math';
import 'package:flutter/material.dart';

class FirstContactPage extends StatefulWidget {
  const FirstContactPage({super.key});

  @override
  State<FirstContactPage> createState() => _FirstContactPageState();
}

class _FirstContactPageState extends State<FirstContactPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('首次接触'),
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                AnimatedBuilder(
                  animation: _animation,
                  builder: (context, child) {
                    return Transform.rotate(
                      angle: _animation.value * 2 * 3.14159,
                      child: Container(
                        width: 250,
                        height: 250,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          gradient: SweepGradient(
                            colors: [
                              Colors.blue[900]!,
                              Colors.blue[300]!,
                              Colors.green[500]!,
                              Colors.blue[900]!,
                            ],
                          ),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.blue[300]!.withOpacity(0.5),
                              blurRadius: 20,
                              spreadRadius: 5,
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 40),
                const Text(
                  '智子探测',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 20),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    '三体文明向地球发送了智子，开启了两个文明之间的首次接触。这个看似微小的粒子，却携带着改变人类文明进程的力量。',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white70,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned.fill(
            child: CustomPaint(
              painter: StarFieldPainter(),
            ),
          ),
        ],
      ),
    );
  }
}

class StarFieldPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final Random random = Random(42);
    final Paint paint = Paint()
      ..color = Colors.white
      ..strokeWidth = 2;

    for (int i = 0; i < 100; i++) {
      final double x = random.nextDouble() * size.width;
      final double y = random.nextDouble() * size.height;
      final double radius = random.nextDouble() * 2;

      canvas.drawCircle(Offset(x, y), radius, paint);
    }
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}