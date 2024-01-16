import 'package:ensword_flutter/player/video_controller.dart';
import 'package:get/get.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import 'package:flutter/material.dart';

const videoId = 'KfHYN6tZnpU';

class Video extends StatefulWidget {
  const Video({super.key});

  @override
  State<Video> createState() => _VideoState();
}

class _VideoState extends State<Video> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    final VideoController videoController = Get.put(VideoController());
    _controller = YoutubePlayerController(
      initialVideoId: videoController.videoId.value,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    )..addListener(videoListener);
  }

  void videoListener() {
    final VideoController videoController = Get.put(VideoController());
    videoController.setPlayTime(_controller.value.position.inSeconds.toDouble());
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
      progressIndicatorColor: Colors.blueAccent,
      progressColors: const ProgressBarColors(
        playedColor: Colors.blueAccent,
        handleColor: Colors.blueAccent,
      ),
      onReady: () {
        // _controller.addListener(listener);
      },
    );
  }
}