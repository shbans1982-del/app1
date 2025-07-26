import 'package:flutter/material.dart';

class ConversationalSkillsPage extends StatelessWidget {
  const ConversationalSkillsPage({super.key});

  @override
  Widget build(BuildContext context) {
    // List of common Lamnso conversational phrases with English translations.
    final List<Map<String, String>> phrases = [
      {'lamnso': 'Ki dze leh?', 'translation': 'How are you?'},
      {'lamnso': 'Pveu yee dze leh?', 'translation': 'How is your family?'},
      {'lamnso': 'Mdze ki djun.', 'translation': 'I am fine.'},
      {'lamnso': 'Beri wo!', 'translation': 'Thank you!'},
      {'lamnso': 'Aberni!', 'translation': 'Goodbye!'},
      {'lamnso': 'Yir yee dze dji la?', 'translation': 'What is your name?'},
      {'lamnso': 'Yir yemi dze dji ...,', 'translation': 'My name is ...'},
      {'lamnso': 'A wiy a dze fo feh?', 'translation': 'Where are you from?'},
      {'lamnso': 'M dze wir Nso.', 'translation': 'I am from Nso.'},
      {'lamnso': 'M wiyi', 'translation': 'I am coming'},
      {'lamnso': 'M si do', 'translation': 'I am going'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Conversational Skills'),
        backgroundColor: Colors.green[700],
      ),
      body: Container(
        // Soothing gradient background for an engaging feel.
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.greenAccent,
              Colors.green[700]!
            ], // Fix the gradient
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
          ),
        ),

        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.all(16),
            children: [
              // Header with an engaging title.
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
                      'Lets Speak Lamnso!',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      'Practice common phrases and greetings in Lamnso!',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white70,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 24),
              // List of conversation phrase cards.
              ...phrases.map(
                (item) => GestureDetector(
                  onTap: () async {
                    const String assetImage = 'assets/images/conversation.png';

                    // Show a dialog displaying the local image before dismissing.
                    showDialog(
                      context: context,
                      barrierDismissible: false,
                      builder: (context) {
                        return Dialog(
                          backgroundColor: Colors.transparent,
                          elevation: 0,
                          child: Center(
                            child: Image.asset(
                              assetImage,
                              fit: BoxFit.cover,
                            ),
                          ),
                        );
                      },
                    );

                    await Future.delayed(const Duration(seconds: 2));

                    if (Navigator.of(context).canPop()) {
                      Navigator.of(context).pop();
                    }

                    // Show a SnackBar with the phrase meaning.
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Lamnso: ${item['lamnso']} means '${item['translation']}'",
                        ),
                        duration: const Duration(seconds: 2),
                      ),
                    );
                  },
                  child: Card(
                    elevation: 4,
                    margin: const EdgeInsets.symmetric(vertical: 8),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: ListTile(
                      leading: const CircleAvatar(
                        backgroundColor: Colors.green,
                        child: Icon(Icons.chat, color: Colors.white),
                      ),
                      title: Text(
                        item['lamnso']!,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      subtitle: Text(
                        "Translation: ${item['translation']!}",
                        style: const TextStyle(fontSize: 14),
                      ),
                      // Trailing widget displays a local conversation-themed image.
                      trailing: Container(
                        height: 50,
                        width: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.grey.shade300,
                            width: 2,
                          ),
                        ),
                        child: ClipOval(
                          child: Image.asset(
                            'assets/images/conversation.png',
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
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
