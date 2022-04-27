import 'dart:math';
import 'package:flutter/material.dart';
import 'package:netflix/Constants/Colors/Colors.dart';

import '../../../api/tmdb_api.dart';

class ElevatedButtonSetUP extends StatelessWidget {
  const ElevatedButtonSetUP({Key? key, required this.onpressed})
      : super(key: key);
  final VoidCallback onpressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: ElevatedButton(
        child: const Text(
          'Set Up',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: onpressed,
      ),
    );
  }
}

class ElevatedButtonDownload extends StatelessWidget {
  const ElevatedButtonDownload({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 50,
        left: 50,
      ),
      child: ElevatedButton(
        child: const Text(
          'See What You Can Download',
          style: TextStyle(
            color: backgroundBlack,
            fontWeight: FontWeight.bold,
          ),
        ),
        onPressed: () {},
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(backgroundWhite)),
      ),
    );
  }
}

class NetworkImagesWidget extends StatelessWidget {
  const NetworkImagesWidget(
      {Key? key,
      required this.images,
      required this.margin,
      required this.size,
      this.angle = 0,
      this.radius = 9.5})
      : super(key: key);

  final String images;
  final double angle;
  final EdgeInsets margin;
  final Size size;
  final double radius;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: margin,
      child: Transform.rotate(
        angle: angle * pi / 180,
        child: Container(
          width: size.width,
          height: size.height,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(radius),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage('${TMDB.imageId}$images'),
            ),
          ),
        ),
      ),
    );
  }
}
