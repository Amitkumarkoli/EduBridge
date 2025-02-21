import 'package:flutter/material.dart';

class TeachersScreen extends StatelessWidget {
  const TeachersScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Teachers'),
      ),
      body: const Center(
        child: Text('Teachers Screen'),
      ),
    );
  }
}
