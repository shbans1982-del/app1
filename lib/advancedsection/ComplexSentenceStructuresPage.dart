import 'package:flutter/material.dart';

class ComplexSentenceStructuresPage extends StatelessWidget {
  const ComplexSentenceStructuresPage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of advanced sentence structures with explanations.
    final List<Map<String, String>> sentences = [
      {
        'sentence': 'Despite the challenges, she excelled.',
        'explanation': 'Using "Despite" for contrast.'
      },
      {
        'sentence': 'Had he studied earlier, he would have passed.',
        'explanation': 'Third conditional sentence.'
      },
      {
        'sentence': 'Not only did he win, but he also broke the record.',
        'explanation': 'Using "Not only ... but also" for emphasis.'
      },
      {
        'sentence': 'The more you practice, the better you become.',
        'explanation': 'Comparative structure.'
      },
      {
        'sentence': 'Unless he apologizes, she will not forgive him.',
        'explanation': 'Using "Unless" for conditions.'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Complex Sentence Structures'),
        backgroundColor: Colors.red[700],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.redAccent, Colors.deepOrangeAccent],
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
                      'Master Complex Sentence Structures!',
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
              ...sentences.map(
                (item) => Card(
                  elevation: 4,
                  margin: const EdgeInsets.symmetric(vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: ListTile(
                    title: Text(
                      item['sentence']!,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    subtitle: Text(
                      "Explanation: ${item['explanation']!}",
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
