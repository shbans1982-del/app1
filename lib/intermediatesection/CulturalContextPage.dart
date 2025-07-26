import 'package:flutter/material.dart';

class CulturalContextPage extends StatelessWidget {
  const CulturalContextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cultural Context - Intermediate'),
        backgroundColor: Colors.green[700],
      ),
      body: const Center(
        child: Text(
          'Learn about the cultural background of the language!',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
