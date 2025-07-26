import 'package:Wanso/Widgets/VideoPlayerScreen.dart';
import 'package:flutter/material.dart';

class VideoListWidget extends StatelessWidget {
  const VideoListWidget({super.key});

  final List<Map<String, String>> videos = const [
    {
      'title': 'Greetings Video',
      'thumbnail': 'assets/videos/greetings_thumb.png',
      'video': 'assets/videos/greetings.mp4'
    },
    {
      'title': 'Numbers Video',
      'thumbnail': 'assets/videos/numbers_thumb.png',
      'video': 'assets/videos/numbers.mp4'
    },
    {
      'title': 'Colors Video',
      'thumbnail': 'assets/videos/colors_thumb.png',
      'video': 'assets/videos/colors.mp4'
    },
  ];

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140, // Fixed height for scrolling videos
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: videos.length,
        itemBuilder: (context, index) {
          final video = videos[index];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        VideoPlayerScreen(videoPath: video['video']!),
                  ),
                );
              },
              child: Column(
                children: [
                  Container(
                    width: 120,
                    height: 80,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      image: DecorationImage(
                        image: AssetImage(video['thumbnail']!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(video['title']!,
                      style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.white)),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
