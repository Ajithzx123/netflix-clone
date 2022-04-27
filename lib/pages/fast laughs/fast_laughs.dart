import 'package:flutter/material.dart';
import 'package:netflix/pages/fast%20laughs/widgets/video_list.dart';

class FastLaughsPage extends StatelessWidget {
  FastLaughsPage({Key? key}) : super(key: key);

  final List<String> videosList = [
    "https://www.learningcontainer.com/wp-content/uploads/2020/05/sample-mp4-file.mp4",
    'https://flutter.github.io/assets-for-api-docs/assets/videos/butterfly.mp4',
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/Sintel.mp4",
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ElephantsDream.mp4',
    'http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/SubaruOutbackOnStreetAndDirt.mp4",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/TearsOfSteel.mp4",
    "http://commondatastorage.googleapis.com/gtv-videos-bucket/sample/WeAreGoingOnBullrun.mp4",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          scrollDirection: Axis.vertical,
          children: List.generate(
            videosList.length,
            (index) {
              return VideoListPage(
                videos: videosList[index],
              );
            },
          ),
        ),
      ),
    );
  }
}
