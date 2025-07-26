import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';

class GreetingsCommonPhrasesPage extends StatefulWidget {
  const GreetingsCommonPhrasesPage({super.key});

  @override
  State<GreetingsCommonPhrasesPage> createState() =>
      _GreetingsCommonPhrasesPageState();
}

class _GreetingsCommonPhrasesPageState
    extends State<GreetingsCommonPhrasesPage> {
  final AudioPlayer _player = AudioPlayer();

  final List<Map<String, String>> phrases = [
    {'phrase': 'M shah ti', 'example': 'Hello', 'audio': 'm_shah_ti.mp3'},
    {
      'phrase': 'Yi ran ni',
      'example': 'Good morning',
      'audio': 'yi_ran_ni.mp3'
    },
    {
      'phrase': 'Beri wo',
      'example': 'Thank you for your help!',
      'audio': 'beri_wo.mp3'
    },
    {
      'phrase': 'A berni',
      'example': 'Goodbye, see you soon!',
      'audio': 'a_berni.mp3'
    },
    {
      'phrase': 'Resi ki djun',
      'example': 'Have a nice day',
      'audio': 'resi_ki_djun.mp3'
    },
    {
      'phrase': 'Ki dze leh?',
      'example': 'How are you?',
      'audio': 'ki_dze_leh.mp3'
    },
    {'phrase': 'Wiy ki djun', 'example': 'Welcome', 'audio': 'wiy_ki_djun.mp3'},
    {'phrase': 'Ki bon', 'example': 'It is nice', 'audio': 'ki_bon.mp3'},
    {'phrase': 'Ki bir', 'example': 'It is bad', 'audio': 'ki_bir.mp3'},
  ];

  Future<void> _playAudio(String filename) async {
    try {
      await _player.play(AssetSource('audio/$filename'));
    } catch (e) {
      debugPrint('Audio playback error: $e');
    }
  }

  @override
  void dispose() {
    _player.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Greetings & Common Phrases'),
        backgroundColor: Colors.blueAccent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: phrases.length,
        itemBuilder: (context, index) {
          final phrase = phrases[index];
          return Card(
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: const Icon(Icons.volume_up, color: Colors.blueAccent),
              title: Text(
                phrase['phrase']!,
                style:
                    const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                phrase['example']!,
                style: const TextStyle(fontSize: 16),
              ),
              onTap: () => _playAudio(phrase['audio']!),
            ),
          );
        },
      ),
    );
  }
}
