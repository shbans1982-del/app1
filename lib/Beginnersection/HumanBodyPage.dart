import 'package:flutter/material.dart';

class HumanBodyPage extends StatelessWidget {
  const HumanBodyPage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of outward human body parts with a title and image asset.
    final List<Map<String, String>> bodyParts = [
      {
        'title': 'Kitu',
        'image': 'assets/images/human_head.png',
      },
      {
        'title': 'Koy',
        'image': 'assets/images/human_arm.png',
      },
      {
        'title': 'Shuin',
        'image': 'assets/images/human_leg.png',
      },
      {
        'title': 'Ntsan',
        'image': 'assets/images/human_torso.png',
      },
      {
        'title': 'Woo',
        'image': 'assets/images/human_hand.png',
      },
      {
        'title': 'Wuu',
        'image': 'assets/images/human_foot.png',
      },
      // Add more body parts here if needed.
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Human Body Parts'),
        backgroundColor: Colors.green,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightGreen, Colors.green],
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(12.0), // Tighter outer padding.
            child: GridView.builder(
              itemCount: bodyParts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // Two columns.
                mainAxisSpacing: 8, // Reduced vertical spacing.
                crossAxisSpacing: 8, // Reduced horizontal spacing.
                childAspectRatio: 1.0, // Square buttons.
              ),
              itemBuilder: (context, index) {
                final part = bodyParts[index];
                return InkWell(
                  onTap: () {
                    // For now, show a SnackBar on tap.
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Learn about ${part['title']}'),
                        duration: const Duration(seconds: 1),
                      ),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(
                        color: Colors.white70,
                        width: 2,
                      ),
                      borderRadius:
                          BorderRadius.circular(16), // Rounded corners.
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.black26,
                          offset: Offset(2, 2),
                          blurRadius: 4,
                        ),
                      ],
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Larger image for the body part.
                        Container(
                          height: 125,
                          width: 125,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: AssetImage(part['image']!),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Display part title.
                        Text(
                          part['title']!,
                          style: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: Colors.black87,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
