import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ThreeBodyHomePage extends StatefulWidget {
  const ThreeBodyHomePage({super.key});

  @override
  State<ThreeBodyHomePage> createState() => _ThreeBodyHomePageState();
}

class _ThreeBodyHomePageState extends State<ThreeBodyHomePage> with SingleTickerProviderStateMixin {
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
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('三体世界'),
        backgroundColor: Colors.black45,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF000B18),  // 深空黑
              Color(0xFF0A2463),  // 星空蓝
            ],
          ),
        ),
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return GridView.count(
              padding: const EdgeInsets.all(16),
              crossAxisCount: 2,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                _buildNavigationCard(
                  '三体世界',
                  'threeBodyWorld',
                  Icons.public,
                ),
                _buildNavigationCard(
                  '首次接触',
                  'firstContact',
                  Icons.connect_without_contact,
                ),
                _buildNavigationCard(
                  '黑暗森林',
                  'darkForest',
                  Icons.forest,
                ),
                _buildNavigationCard(
                  '面壁计划',
                  'wallfacer',
                  Icons.security,
                ),
                _buildNavigationCard(
                  '降维打击',
                  'dimensionalStrike',
                  Icons.architecture,
                ),
                _buildNavigationCard(
                  '宇宙的命运',
                  'universeDestiny',
                  Icons.all_inclusive,
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget _buildNavigationCard(String title, String routeName, IconData icon) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Transform.scale(
          scale: 1.0 + (_animation.value * 0.05),
          child: Card(
            elevation: 8 + (_animation.value * 4),
            color: Colors.black87,
            child: InkWell(
              onTap: () => context.pushNamed(routeName),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    icon,
                    size: 48,
                    color: Colors.white70,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    title,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}