import 'package:get/state_manager.dart';

class VideoController extends GetxController {
  var videoId = 'KfHYN6tZnpU'.obs;
  var videoList = [].obs;
  var playTime = 0.0.obs;

  void setVideoId(String id) {
    videoId.value = id;
  }

  void setPlayTime(double time) {
    playTime.value = time;
  }
}