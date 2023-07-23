import 'package:c_lalzarmawia/lyrics/image_lyrics.dart';
import 'package:c_lalzarmawia/lyrics/lyrics.dart';
import 'package:flutter/material.dart';

class LyricsScreen extends StatelessWidget {
  const LyricsScreen({
    Key? key,
    required this.titleNumber,
  }) : super(key: key);

  final int titleNumber;

  @override
  Widget build(BuildContext context) {
    final lyrics = lyric[titleNumber - 1] ?? '';
    final image = imageLyrics[titleNumber - 1] ??
        ''; // Assuming you have a map called `imageBlock`

    return Scaffold(
      appBar: AppBar(),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return SingleChildScrollView(
            child: Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 35),
              child: Column(
                children: [
                  Image.asset(
                    image, // Use the image asset path
                    fit: BoxFit.cover, // Set the appropriate fit
                    width: double.infinity, // Adjust the width as needed
                    height: 200, // Adjust the height as needed
                  ),
                  Text(
                    lyrics,
                    style: const TextStyle(fontSize: 17),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
