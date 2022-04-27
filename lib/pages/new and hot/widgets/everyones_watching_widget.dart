import 'package:flutter/material.dart';

import '../../../api/tmdb_api.dart';
import '../../../constants/widgets/constant_widgets.dart';
import '../../fast laughs/widgets/video_list.dart';

class EveryonesWatchingWidget extends StatelessWidget {
  const EveryonesWatchingWidget({
    required this.imageURL,
    required this.movieTitle,
    required this.movieDescription,
    Key? key,
  }) : super(key: key);

  final String imageURL;
  final String movieTitle;
  final String movieDescription;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: Row(
            children: [
              Container(
                width: 350,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage('${TMDB.imageId}$imageURL'),
                  ),
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            const Spacer(),
            VideoListAvatarButton(
              icon: Icons.share_outlined,
              title: 'Share',
              onPressed: () {},
            ),
            VideoListAvatarButton(
              icon: Icons.add,
              title: 'My List',
              onPressed: () {},
            ),
            VideoListAvatarButton(
              icon: Icons.play_arrow,
              title: 'Play',
              onPressed: () {},
            ),
          ],
        ),
        kVerticalSpace,
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Row(
            children: [
              Text(
                movieTitle,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        kVerticalSpace,
        Padding(
          padding: const EdgeInsets.only(left: 5),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  movieDescription,
                ),
              ),
            ],
          ),
        ),
        kVerticalSpace,
      ],
    );
  }
}
