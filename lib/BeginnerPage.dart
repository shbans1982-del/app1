import 'package:Wanso/Widgets/VideoListWidget.dart';
import 'package:flutter/material.dart';
import 'package:Wanso/Beginnersection/ColorsPage.dart';
import 'package:Wanso/Beginnersection/GreetingsCommonPhrasesPage.dart';
import 'package:Wanso/Beginnersection/HumanBodyPage.dart';
import 'package:Wanso/Beginnersection/NumbersPage.dart';

class BeginnerPage extends StatelessWidget {
  const BeginnerPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> topics = [
      {
        'title': 'Greetings',
        'image': 'assets/images/greetings.png',
        'widget': const GreetingsCommonPhrasesPage()
      },
      {
        'title': 'Numbers',
        'image': 'assets/images/numbers.png',
        'widget': const NumbersPage()
      },
      {
        'title': 'Colors',
        'image': 'assets/images/colors.png',
        'widget': const ColorsPage()
      },
      {
        'title': 'Human Body',
        'image': 'assets/images/human_body.png',
        'widget': const HumanBodyPage()
      },
    ];

    return Scaffold(
      appBar: AppBar(
          title: const Text('Beginner Topics'),
          backgroundColor: Colors.blueAccent),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.lightBlueAccent, Colors.blueAccent],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 12),
                child: VideoListWidget(), // Link to video widget
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: GridView.builder(
                    itemCount: topics.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.0,
                      mainAxisSpacing: 8,
                      crossAxisSpacing: 8,
                    ),
                    itemBuilder: (context, index) {
                      final topic = topics[index];

                      return InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => topic['widget']));
                        },
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.white70, width: 2),
                            borderRadius: BorderRadius.circular(16),
                            boxShadow: const [
                              BoxShadow(
                                  color: Colors.black26,
                                  offset: Offset(2, 2),
                                  blurRadius: 4)
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                height: 100,
                                width: 100,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  image: DecorationImage(
                                      image: AssetImage(topic['image']),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(topic['title'],
                                  style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black87)),
                            ],
                          ),
                        ),
                      );
                    },
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
