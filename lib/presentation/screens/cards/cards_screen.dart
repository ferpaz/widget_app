import 'package:flutter/material.dart';

class CardsScreen extends StatelessWidget {

  static const String screenName = 'cards_screen';

  const CardsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cards Screen'),
        ),
        body: _CardsView()
    );
  }
}

class _CardsView extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}