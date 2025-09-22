import 'package:flutter/material.dart';

class SequentialLoadingDots extends StatefulWidget {
  const SequentialLoadingDots({super.key});

  @override
  State<SequentialLoadingDots> createState() => _SequentialLoadingDotsState();
}

class _SequentialLoadingDotsState extends State<SequentialLoadingDots>
    with TickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget _buildDot(int index) {
    final start = index * 0.2;
    final end = start + 0.4;

    final animation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Interval(start, end, curve: Curves.easeInOut),
      ),
    );

    return AnimatedBuilder(
      animation: animation,
      builder: (context, child) {
        final scale = animation.value;
        return Transform.scale(
          scale: scale,
          child: Container(
            width: 14,
            height: 14,
            margin: const EdgeInsets.symmetric(horizontal: 2),
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Sequential Loading Dots')),
      backgroundColor: const Color(0xFFF6F0FA),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(3, (i) => _buildDot(i)),
        ),
      ),
    );
  }
}
