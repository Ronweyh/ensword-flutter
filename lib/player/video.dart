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
    VideoController videoController = Get.find<VideoController>();
    _controller = YoutubePlayerController(
      initialVideoId: videoController.videoId.value,
      flags: const YoutubePlayerFlags(
        autoPlay: false,
        mute: false,
      ),
    )..addListener(videoListener);
    videoController.setController(_controller);
  }

  void videoListener() {
    VideoController videoController = Get.find<VideoController>();
    videoController.setPlayTime(_controller.value.position.inSeconds.toDouble());
    videoController.setPlayTimeStr(
        _controller.value.position.inHours,
        _controller.value.position.inMinutes,
        _controller.value.position.inSeconds);
    
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