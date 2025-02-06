import 'package:flutter/material.dart';

class DimensionalStrikePage extends StatefulWidget {
  const DimensionalStrikePage({super.key});

  @override
  State<DimensionalStrikePage> createState() => _DimensionalStrikePageState();
}

class _DimensionalStrikePageState extends State<DimensionalStrikePage> with TickerProviderStateMixin {
  late AnimationController _collapseController;
  late AnimationController _waveController;
  late Animation<double> _collapseAnimation;
  late Animation<double> _waveAnimation;

  @override
  void initState() {
    super.initState();
    _collapseController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );
    _waveController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _collapseAnimation = CurvedAnimation(
      parent: _collapseController,
      curve: Curves.easeInOut,
    );

    _waveAnimation = CurvedAnimation(
      parent: _waveController,
      curve: Curves.easeInOut,
    );

    _waveController.repeat(reverse: true);
    _collapseController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _collapseController.dispose();
    _waveController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('降维打击'),
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
                      animation: _collapseAnimation,
                      builder: (context, child) {
                        return Transform(
                          transform: Matrix4.identity()
                            ..setEntry(3, 2, 0.001)
                            ..rotateX(_collapseAnimation.value * 3.14159)
                            ..scale(1.0 - _collapseAnimation.value * 0.3),
                          alignment: Alignment.center,
                          child: Container(
                            width: 300,
                            height: 300,
                            decoration: BoxDecoration(
                              color: Colors.blue[900],
                              borderRadius: BorderRadius.circular(20),
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
                    AnimatedBuilder(
                      animation: _waveAnimation,
                      builder: (context, child) {
                        return Container(
                          width: 200 + (_waveAnimation.value * 100),
                          height: 200 + (_waveAnimation.value * 100),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.white.withOpacity(
                                  1.0 - _waveAnimation.value),
                              width: 2,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                const Text(
                  '二向箔',
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
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                  decoration: BoxDecoration(
                    color: Colors.white.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: const Text(
                    '降维打击：将三维空间压缩至二维平面，这是宇宙中最可怕的武器。',
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