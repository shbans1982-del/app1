import 'package:Wanso/intermediatesection/ConversationalSkillsPage.dart';
import 'package:Wanso/intermediatesection/CulturalContextPage.dart';
import 'package:Wanso/intermediatesection/GrammarRulesPage.dart';
import 'package:flutter/material.dart';

class IntermediatePage extends StatelessWidget {
  const IntermediatePage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> intermediateTopics = [
      {
        'title': 'Grammar Rules - Intermediate Level',
        'widget': const GrammarRulesPage(),
      },
      {
        'title': 'Conversational Skills - Intermediate Level',
        'widget': const ConversationalSkillsPage(),
      },
      {
        'title': 'Cultural Context - Intermediate Level',
        'widget': const CulturalContextPage(),
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Intermediate Topics'),
        backgroundColor: Colors.green[700],
      ),
      body: ListView.builder(
        itemCount: intermediateTopics.length,
        itemBuilder: (context, index) {
          final topic = intermediateTopics[index];
          return Card(
            margin: const EdgeInsets.all(8.0),
            child: ListTile(
              title: Text(
                topic['title'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
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
