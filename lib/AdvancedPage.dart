import 'package:Wanso/advancedsection/ComplexSentenceStructuresPage.dart';
import 'package:Wanso/advancedsection/HumorColloquialExpressionsPage.dart';
import 'package:flutter/material.dart';

class AdvancedPage extends StatelessWidget {
  const AdvancedPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> advancedTopics = [
      {
        'title': 'Complex Sentence Structures - Advanced Level',
        'widget': const ComplexSentenceStructuresPage(),
      },
      {
        'title':
            'Understanding Humor & Colloquial Expressions - Advanced Level',
        'widget': const HumorColloquialExpressionsPage(),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Advanced Learning Sections'),
        backgroundColor: Colors.red[700],
      ),
      body: ListView.builder(
        itemCount: advancedTopics.length,
        itemBuilder: (context, index) {
          final topic = advancedTopics[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                topic['title'],
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              trailing: Container(
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(color: Colors.grey.shade300, width: 2),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/${topic['title'].toLowerCase().replaceAll(" ", "_")}.png',
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const Icon(Icons.school, size: 32);
                    },
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => topic['widget']),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
