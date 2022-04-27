import 'package:flutter/material.dart';

import '../../../api/tmdb_api.dart';
import '../../../constants/colors/colors.dart';
import 'icon_buttons.dart';

class BackgroundImageCard extends StatelessWidget {
  const BackgroundImageCard({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: double.infinity,
          height: 500,
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                '${TMDB.imageId}$image',
              ),
            ),
          ),
        ),
        Positioned(
          bottom: 50,
          left: 0,
          right: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Text(
                'Rousing • Action & Adventure • Drama',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        Positioned(
          bottom: 0,
          right: 0,
          left: 0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              const CustomIconButton(
                icon: Icons.add,
                title: 'My List',
              ),
              _playButton(),
              const CustomIconButton(
                icon: Icons.info_outline,
                title: 'Info',
              ),
            ],
          ),
        )
      ],
    );
  }

  TextButton _playButton() {
    return TextButton.icon(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(backgroundWhite),
        minimumSize: MaterialStateProperty.all(
          const Size(94, 38),
        ),
        maximumSize: MaterialStateProperty.all(
          const Size(94, 38),
        ),
      ),
      onPressed: () {},
      icon: const Icon(
        Icons.play_arrow,
        color: backgroundBlack,
      ),
      label: const Padding(
        padding: EdgeInsets.only(right: 7),
        child: Text(
          'Play',
          style: TextStyle(
            color: backgroundBlack,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
