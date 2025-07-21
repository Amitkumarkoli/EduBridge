import 'package:flutter/material.dart';

class PrizesScreen extends StatelessWidget {
  const PrizesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Prizes'),
      ),
      body: const Center(
        child: Text('Prizes Screen'),
      ),
    );
  }
}
