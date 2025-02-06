import 'package:flutter/material.dart';

class WallfacerPage extends StatefulWidget {
  const WallfacerPage({super.key});

  @override
  State<WallfacerPage> createState() => _WallfacerPageState();
}

class _WallfacerPageState extends State<WallfacerPage> with TickerProviderStateMixin {
  late AnimationController _rotationController;
  late AnimationController _pulseController;
  late Animation<double> _rotationAnimation;
  late Animation<double> _pulseAnimation;

  @override
  void initState() {
    super.initState();
    _rotationController = AnimationController(
      duration: const Duration(seconds: 20),
      vsync: this,
    );
    _pulseController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _rotationAnimation = CurvedAnimation(
      parent: _rotationController,
      curve: Curves.linear,
    );

    _pulseAnimation = CurvedAnimation(
      parent: _pulseController,
      curve: Curves.easeInOut,
    );

    _rotationController.repeat();
    _pulseController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _rotationController.dispose();
    _pulseController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('面壁计划'),
        backgroundColor: Colors.black45,
      ),
      body: Stack(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    AnimatedBuilder(
                      animation: _rotationAnimation,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: _rotationAnimation.value * 2 * 3.14159,
                          child: Container(
                            width: 300,
                            height: 300,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              gradient: SweepGradient(
                                colors: [
                                  Colors.blue[900]!,
                                  Colors.purple[500]!,
                                  Colors.red[500]!,
                                  Colors.blue[900]!,
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    AnimatedBuilder(
                      animation: _pulseAnimation,
                      builder: (context, child) {
                        return Container(
                          width: 150 + (_pulseAnimation.value * 30),
                          height: 150 + (_pulseAnimation.value * 30),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white.withOpacity(0.2),
                            border: Border.all(
                              color: Colors.white.withOpacity(0.5),
                              width: 2,
                            ),
                          ),
                          child: const Center(
                            child: Text(
                              '面壁者',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    '面壁者计划：人类文明的最后希望，一场智慧与欺骗的终极博弈。',
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