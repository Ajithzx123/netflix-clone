import 'package:bordered_text/bordered_text.dart';
import 'package:flutter/material.dart';

import '../../../api/tmdb_api.dart';
import '../../../constants/colors/colors.dart';

class PlayIconCard extends StatelessWidget {
  const PlayIconCard({Key? key, required this.imageURL}) : super(key: key);

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 100,
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage('${TMDB.imageId}$imageURL'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(
          top: 50,
          left: 30,
          child: CircleAvatar(
            radius: 23,
            backgroundColor: backgroundWhite.withOpacity(0.8),
            child: CircleAvatar(
              radius: 20,
              backgroundColor: backgroundBlack.withOpacity(0.1),
              child: const Icon(
                Icons.play_arrow,
                color: backgroundWhite,
              ),
            ),
          ),
        ),
        Positioned(
          top: 130,
          child: Container(
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 132, 131, 131),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10),
                bottomRight: Radius.circular(10),
              ),
            ),
            height: 20,
            width: 100,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(
                    Icons.info_outline,
                    color: backgroundWhite,
                    size: 17,
                  ),
                  Icon(
                    Icons.more_vert,
                    color: backgroundWhite,
                    size: 17,
                  ),
                ],
              ),
            ),
          ),
        )
      ],
    );
  }
}

class CommonIconCards extends StatelessWidget {
  const CommonIconCards({Key? key, required this.imageURL}) : super(key: key);

  final String imageURL;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 150,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
          image: NetworkImage('${TMDB.imageId}$imageURL'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class NumberCard extends StatelessWidget {
  const NumberCard({Key? key, required this.index, required this.image})
      : super(key: key);
  final String image;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            const SizedBox(
              width: 20,
              height: 100,
            ),
            Container(
              width: 100,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: NetworkImage('${TMDB.imageId}$image'),
                ),
              ),
            ),
          ],
        ),
        Positioned(
          top: 65,
          child: BorderedText(
            strokeColor: backgroundWhite,
            strokeWidth: 3,
            child: Text(
              '$index',
              style: const TextStyle(
                fontSize: 85,
                color: backgroundBlack,
              ),
            ),
          ),
        )
      ],
    );
  }
}
