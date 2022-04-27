import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix/Constants/Colors/Colors.dart';

import '../../constants/widgets/constant_widgets.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar(
      {Key? key,
      required this.imageLink,
      required this.iconData,
      required this.avatarLink})
      : super(key: key);

  final String imageLink;
  final IconData iconData;
  final String avatarLink;

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 80,
      backgroundColor: Colors.transparent,
      bottom: PreferredSize(
        preferredSize: const Size(0, 0),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              const Text('TV Shows'),
              const Text('Movies'),
              Row(
                children: const [
                  Text('Categories'),
                  Icon(
                    Icons.arrow_drop_down,
                    color: backgroundWhite,
                    size: 20,
                  )
                ],
              ),
            ],
          ),
        ),
      ),
      elevation: 0,
      leading: Image.asset(
        imageLink,
        width: 50,
        height: 50,
      ),
      actions: [
        Icon(
          iconData,
          size: 25,
        ),
        Image.asset(
          avatarLink,
          width: 40,
          height: 40,
        ),
      ],
    );
  }
}

class CustomAppBarNewAndDownloads extends StatelessWidget {
  const CustomAppBarNewAndDownloads({Key? key, required this.title})
      : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        kHorizontalSpace,
        Padding(
          padding: const EdgeInsets.only(top: 2),
          child: Text(
            title,
            style: GoogleFonts.montserrat(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const Spacer(),
        Padding(
          padding: const EdgeInsets.only(top: 3),
          child: Row(
            children: [
              const Icon(
                Icons.cast,
                size: 25,
                color: backgroundWhite,
              ),
              Image.asset(
                'assets/images/ironman-avatar.png',
                height: 40,
                width: 40,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
