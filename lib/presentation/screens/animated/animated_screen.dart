import 'package:flutter/material.dart';
import 'dart:math' as math;

class AnimatedScreen extends StatefulWidget {
  static const String screenName = 'animated_screen';

  const AnimatedScreen({super.key});

  @override
  State<AnimatedScreen> createState() => _AnimatedScreenState();
}

class _AnimatedScreenState extends State<AnimatedScreen> {
  double width = 300;
  double height = 200;
  Color color = Colors.blue;
  double borderRadius = 20.0;

  void changeShape() {
    setState(() {
      width = math.Random().nextInt(300).toDouble() + 50.0;
      height = math.Random().nextInt(400).toDouble() + 50.0;

      borderRadius = math.Random().nextInt(100).toDouble() + 10.0;

      final r = math.Random().nextInt(255);
      final g = math.Random().nextInt(255);
      final b = math.Random().nextInt(255);

      color = Color.fromRGBO(r, g, b, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Animated Container'),
      ),
      body: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 400),
          curve: Curves.elasticOut,
          width: width <= 0 ? 0 : width,
          height: height <= 0 ? 0 : height,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(borderRadius <= 0 ? 0 : borderRadius),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => changeShape(),
        child: const Icon(Icons.play_arrow_rounded),
      )
    );
  }
}