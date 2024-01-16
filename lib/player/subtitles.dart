import 'package:ensword_flutter/player/srt_parser.dart';
import 'package:flutter/material.dart';

class Subtitles extends StatefulWidget {
  const Subtitles({super.key});

  @override
  State<Subtitles> createState() => _SubtitlesState();
}

class _SubtitlesState extends State<Subtitles> {
  // final List<Subtitle> subtitles = SrtParser.parse('assets/subtitles.srt');
  List<Subtitle> subtitles = [];
  @override
  void initState() {
    super.initState();
    const srtString = """
1
00:00:00,000 --> 00:00:07,000
Translator: Riaki Poništ Reviewer: Peter van de Ven

2
00:00:09,070 --> 00:00:10,810
Thank you so much.

3
00:00:12,390 --> 00:00:14,199
I am a journalist.

4
00:00:14,539 --> 00:00:18,029
My job is to talk to people from all walks of life,

5
00:00:18,239 --> 00:00:19,919
all over the world.

6
00:00:19,999 --> 00:00:21,439
Today, I want to tell you
""";
    var srtData = parseSrt(srtString);
    // print(srtData);
    subtitles = srtData;
  }

  @override
  Widget build(BuildContext context) {
    // parseSrt(srt)
    return Container(
      color: Colors.grey[200], // Adjust color as needed
      child: ListView.builder(
        itemCount: subtitles.length,
        itemBuilder: (BuildContext context, int index) {
          return _buildSubtitle(subtitles[index]);
        },
      ),
    );
  }

  Widget _buildSubtitle(Subtitle subtitle) {
    return Container(
      height: 28,
      padding: const EdgeInsets.all(4),
      child: ListTile(
          title: Text(subtitle.rawLines.join('\n'),
              style: const TextStyle(fontSize: 14))),
    );
  }
}
