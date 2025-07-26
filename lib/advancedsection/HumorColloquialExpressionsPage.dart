import 'package:flutter/material.dart';

class HumorColloquialExpressionsPage extends StatelessWidget {
  const HumorColloquialExpressionsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of humorous and colloquial expressions with meanings.
    final List<Map<String, String>> expressions = [
      {
        'expression': "It's raining cats and dogs.",
        'meaning': 'It is raining very heavily.'
      },
      {'expression': "Break a leg!", 'meaning': 'Good luck!'},
      {
        'expression': "Bite the bullet.",
        'meaning': 'To endure something difficult.'
      },
      {'expression': "Hit the sack.", 'meaning': 'Go to bed.'},
      {'expression': "Spill the beans.", 'meaning': 'Reveal a secret.'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Humor & Colloquial Expressions'),
        backgroundColor: Colors.deepOrange[700],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.orangeAccent, Colors.redAccent],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Center(
                child: Column(
                  children: [
                    Container(
                      height: 150,
                      width: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.white, width: 4),
                      ),
                      child: ClipOval(
                        child: Image.asset(
                          'assets/images/logo.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    const Text(
                      'Master Humor & Colloquial Expressions!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              ...expressions.map(
                (item) => Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    title: Text(
                      item['expression']!,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Meaning: ${item['meaning']!}",
                      style: const TextStyle(fontSize: 14),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
