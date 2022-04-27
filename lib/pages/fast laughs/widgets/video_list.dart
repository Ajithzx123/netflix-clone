import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:video_player/video_player.dart';

import '../../../constants/colors/colors.dart';
import '../../../constants/widgets/constant_widgets.dart';

class VideoListPage extends StatefulWidget {
  const VideoListPage({Key? key, required this.videos}) : super(key: key);
  final String videos;

  @override
  State<VideoListPage> createState() => _VideoListPageState();
}

class _VideoListPageState extends State<VideoListPage> {
  Future<void>? _video;
  VideoPlayerController? controller;

  @override
  void initState() {
    super.initState();
    controller = VideoPlayerController.network(widget.videos);
    _video = controller!.initialize();
  }

  @override
  void dispose() {
    super.dispose();
    controller!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isMuted = controller!.value.volume == 0;
    return Stack(
      children: [
        FutureBuilder(
          future: _video,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Container(
                // color: Colors.accents[widget.index % Colors.accents.length],
                child: VideoPlayer(controller!),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    controller!.setVolume(isMuted ? 1 : 0);
                  });
                },
                icon: Icon(
                  isMuted
                      ? CupertinoIcons.volume_off
                      : CupertinoIcons.volume_up,
                  color: backgroundWhite,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  CircleAvatar(
                    backgroundImage:
                        const AssetImage('assets/images/ironman-avatar.png'),
                    backgroundColor: backgroundBlack.withOpacity(0.5),
                    radius: 23,
                  ),
                  kVerticalSpace,
                  VideoListAvatarButton(
                    icon: Icons.emoji_emotions,
                    title: 'LOL',
                    onPressed: () {},
                  ),
                  VideoListAvatarButton(
                    icon: Icons.add,
                    title: 'My List',
                    onPressed: () {},
                  ),
                  VideoListAvatarButton(
                    icon: Icons.telegram_outlined,
                    title: 'Share',
                    onPressed: () {},
                  ),
                  VideoListAvatarButton(
                    icon: controller!.value.isPlaying
                        ? Icons.pause
                        : Icons.play_arrow,
                    title: 'Play',
                    onPressed: () {
                      if (controller!.value.isPlaying) {
                        setState(() {
                          controller!.pause();
                        });
                      } else {
                        setState(() {
                          controller!.play();
                        });
                      }
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class VideoListAvatarButton extends StatelessWidget {
  const VideoListAvatarButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.onPressed,
  }) : super(key: key);
  final IconData icon;
  final String title;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 15),
      child: Column(
        children: [
          IconButton(
            icon: Icon(icon),
            color: backgroundWhite,
            onPressed: onPressed,
            iconSize: 30,
          ),
          Text(
            title,
            style: const TextStyle(
              color: backgroundWhite,
              fontSize: 10,
            ),
          ),
        ],
      ),
    );
  }
}
