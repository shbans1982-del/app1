import 'package:flutter/material.dart';

class ColorsPage extends StatelessWidget {
  const ColorsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> colors = [
      {'name': 'Red', 'color': Colors.red},
      {'name': 'Blue', 'color': Colors.blue},
      {'name': 'Green', 'color': Colors.green},
      {'name': 'Yellow', 'color': Colors.yellow},
      {'name': 'Orange', 'color': Colors.orange},
      {'name': 'Purple', 'color': Colors.purple},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Colors'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: GridView.builder(
          itemCount: colors.length,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Two columns
            childAspectRatio: 1.2, // Adjust the button proportions
            mainAxisSpacing: 12, // Space between rows
            crossAxisSpacing: 12, // Space between columns
          ),
          itemBuilder: (context, index) {
            final color = colors[index];
            return ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: color['color'],
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(30), // Fully rounded buttons
                ),
                minimumSize:
                    const Size(120, 80), // Adjust size for better appearance
              ),
              onPressed: () {
                // Action when button is clicked (you can customize this)
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("You selected ${color['name']}!"),
                    backgroundColor: color['color'],
                  ),
                );
              },
              child: Text(
                color['name'],
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
