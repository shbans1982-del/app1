import 'package:flutter/material.dart';

class NumbersPage extends StatelessWidget {
  const NumbersPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> numbers = [
      {'num': 'Mo-on', 'image': 'assets/images/number_1.png'},
      {'num': 'Baah', 'image': 'assets/images/number_2.png'},
      {'num': 'Tar', 'image': 'assets/images/number_3.png'},
      {'num': 'Kweh', 'image': 'assets/images/number_4.png'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Numbers'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: numbers.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 1.0,
            mainAxisSpacing: 8,
            crossAxisSpacing: 8,
          ),
          itemBuilder: (context, index) {
            final number = numbers[index];
            return Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: const [
                  BoxShadow(color: Colors.black26, blurRadius: 4)
                ],
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(number['image']!, height: 100),
                  const SizedBox(height: 8),
                  Text(
                    number['num']!,
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
