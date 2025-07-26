import 'package:flutter/material.dart';

class GrammarRulesPage extends StatelessWidget {
  const GrammarRulesPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Grammar Rules - Intermediate'),
        backgroundColor: Colors.green[700],
      ),
      body: const Center(
        child: Text(
          'Here you will learn intermediate grammar rules!',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
