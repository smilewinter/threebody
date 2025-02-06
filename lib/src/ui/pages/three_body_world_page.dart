import 'package:flutter/material.dart';

class ThreeBodyWorldPage extends StatefulWidget {
  const ThreeBodyWorldPage({super.key});

  @override
  State<ThreeBodyWorldPage> createState() => _ThreeBodyWorldPageState();
}

class _ThreeBodyWorldPageState extends State<ThreeBodyWorldPage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );
    _animation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOut,
    );
    _controller.repeat(reverse: true);
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
        title: const Text('三体世界'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.scale(
                  scale: 1.0 + (_animation.value * 0.2),
                  child: Container(
                    width: 200,
                    height: 200,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: RadialGradient(
                        colors: [
                          Colors.blue[700]!,
                          Colors.blue[200]!,
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 40),
            const Text(
              '三体世界',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 20),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 32),
              child: Text(
                '在这个不稳定的世界中，三颗恒星的混沌运动导致了极端的气候变化，文明在毁灭与重生中循环。',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    );
  }
}