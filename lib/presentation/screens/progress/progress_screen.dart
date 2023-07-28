import 'package:flutter/material.dart';

class ProgressScreen extends StatelessWidget {
  static const String screenName = 'progress_screen';

  const ProgressScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Progress Indicators'),
      ),
      body: const _ProgressView(),
    );
  }
}

class _ProgressView extends StatelessWidget {
  const _ProgressView();

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        children: [
          SizedBox(height: 30),
          Text('Circular progress indicator'),
          SizedBox(height: 30),
          CircularProgressIndicator(
            strokeWidth: 2,
            backgroundColor: Colors.black45,
          ),
          SizedBox(height: 30),
          Text('Circular and linear managed progress indicator'),
          SizedBox(height: 30),
          _ManagedCircularProgressIndicator(),
        ]),
    );
  }
}

class _ManagedCircularProgressIndicator extends StatelessWidget {
  const _ManagedCircularProgressIndicator();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(
        const Duration(milliseconds: 300),
        (value) => (value * 2) / 100
      ).takeWhile((value) => value < 100),
      builder: (context, snapshot) {

        final double? progressValue = snapshot.hasData ? snapshot.data : 0;

        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircularProgressIndicator(
                value: progressValue,
                backgroundColor: Colors.black45,
              ),
              const SizedBox(width: 20),
              Expanded(
                child: LinearProgressIndicator(
                  value: progressValue,
                  backgroundColor: Colors.black45,
                ),
              ),
            ],
          ),
        );
      }
    );
  }
}