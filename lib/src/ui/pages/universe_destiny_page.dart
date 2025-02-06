import 'package:flutter/material.dart';

class UniverseDestinyPage extends StatefulWidget {
  const UniverseDestinyPage({super.key});

  @override
  State<UniverseDestinyPage> createState() => _UniverseDestinyPageState();
}

class _UniverseDestinyPageState extends State<UniverseDestinyPage> with TickerProviderStateMixin {
  late AnimationController _expansionController;
  late AnimationController _fadeController;
  late Animation<double> _expansionAnimation;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _expansionController = AnimationController(
      duration: const Duration(seconds: 10),
      vsync: this,
    );
    _fadeController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _expansionAnimation = CurvedAnimation(
      parent: _expansionController,
      curve: Curves.easeInOut,
    );

    _fadeAnimation = CurvedAnimation(
      parent: _fadeController,
      curve: Curves.easeInOut,
    );

    _expansionController.repeat(reverse: true);
    _fadeController.repeat(reverse: true);
  }

  @override
  void dispose() {
    _expansionController.dispose();
    _fadeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('宇宙的命运'),
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
                      animation: _expansionAnimation,
                      builder: (context, child) {
                        return Container(
                          width: 300 + (_expansionAnimation.value * 100),
                          height: 300 + (_expansionAnimation.value * 100),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(
                              colors: [
                                Colors.purple[900]!,
                                Colors.deepPurple[500]!.withOpacity(0.5),
                                Colors.transparent,
                              ],
                              stops: const [0.2, 0.5, 1.0],
                            ),
                          ),
                        );
                      },
                    ),
                    AnimatedBuilder(
                      animation: _fadeAnimation,
                      builder: (context, child) {
                        return Container(
                          width: 200,
                          height: 200,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            gradient: RadialGradient(
                              colors: [
                                Colors.white.withOpacity(_fadeAnimation.value),
                                Colors.transparent,
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 40),
                const Text(
                  '归零者',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    shadows: [
                      Shadow(
                        color: Colors.purple,
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
                    border: Border.all(
                      color: Colors.purple.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: const Text(
                    '在宇宙的尽头，归零者选择改变物理学常数，让宇宙重新开始。这是对生命与宇宙的终极思考。',
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