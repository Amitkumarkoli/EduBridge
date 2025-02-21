import 'package:flutter/material.dart';

class QueryScreen extends StatelessWidget {
  const QueryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Query'),
      ),
      body: const Center(
        child: Text('Query Screen'),
      ),
    );
  }
}
