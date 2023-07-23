import 'package:flutter/material.dart';
import '../lyrics/title_lyrics.dart';
import 'package:c_lalzarmawia/screen/lyrics_screen.dart';

class TitleScreen extends StatelessWidget {
  const TitleScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Stack(
        children: [
          ListView.builder(
            itemCount: titleLyrics.length,
            itemBuilder: (context, index) {
              int titleNumber = index + 1;
              return Card(
                child: ListTile(
                  title: Text(
                    titleLyrics[index],
                    style: const TextStyle(fontSize: 17),
                  ),
                  onTap: () {
                    print(index + 1); // Print index for ChapterScreen
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LyricsScreen(
                          titleNumber: index + 1,
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
