import 'package:get/state_manager.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class VideoController extends GetxController {
  var videoId = 'KfHYN6tZnpU'.obs;
  var videoList = [].obs;
  var playTime = 0.0.obs;
  var playTimeStr = '00:00:00'.obs;
  late YoutubePlayerController controller;

  void setVideoId(String id) {
    videoId.value = id;
  }

  void setPlayTime(double time) {
    playTime.value = time;
  }

  void setPlayTimeStr(int hour, int minute, int second) {
    playTimeStr.value =
        '${hour.toString().padLeft(2, "0")}:${minute.toString().padLeft(2, "0")}:${second.toString().padLeft(2, "0")}';
  }

  void setController(YoutubePlayerController c) {
    controller = c;
  }

  void seekTo(int time) {
    controller.seekTo(Duration(milliseconds: time));
  }
}
