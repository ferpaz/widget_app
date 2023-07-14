import 'package:flutter/material.dart';

class ButtonsScreen extends StatelessWidget {
  const ButtonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Buttons Screen'),
        ),
        body: _ButtonsView()
    );
  }
}

class _ButtonsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}