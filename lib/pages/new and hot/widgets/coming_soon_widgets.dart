import 'package:flutter/material.dart';
import 'package:netflix/Constants/Colors/Colors.dart';

import '../../../api/tmdb_api.dart';
import '../../../constants/widgets/constant_widgets.dart';
import '../../fast laughs/widgets/video_list.dart';

class ComingSoonWidgets extends StatelessWidget {
  const ComingSoonWidgets({
    Key? key,
    required this.width,
    required this.date,
    required this.day,
    required this.imageURL,
    required this.comingSoonDate,
    required this.movieName,
    required this.movieDescription,
  }) : super(key: key);

  final double width;
  final String date;
  final String day;
  final String imageURL;
  final String comingSoonDate;
  final String movieName;
  final String movieDescription;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 50,
          height: 450,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                date,
                style: const TextStyle(
                  fontSize: 16,
                  color: backgroundGrey,
                ),
              ),
              Text(
                day,
                style: const TextStyle(
                  fontSize: 30,
                  letterSpacing: 4,
                  fontWeight: FontWeight.bold,
                ),
              )
            ],
          ),
        ),
        SizedBox(
          width: width - 55,
          height: 450,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                          '${TMDB.imageId}$imageURL',
                        ),
                      ),
                    ),
                    width: double.infinity,
                    height: 180,
                  ),
                  const Positioned(
                    left: 270,
                    top: 150,
                    child: Icon(
                      Icons.volume_off_outlined,
                      color: backgroundWhite,
                      size: 20,
                    ),
                  ),
                ],
              ),
              kVerticalSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Spacer(),
                  VideoListAvatarButton(
                    icon: Icons.add_alert_outlined,
                    title: 'Remind Me',
                    onPressed: () {},
                  ),
                  VideoListAvatarButton(
                    icon: Icons.info_outline,
                    title: 'Info',
                    onPressed: () {},
                  ),
                ],
              ),
              // kVerticalSpace,
              Text(
                comingSoonDate,
              ),
              kVerticalSpace,
              Text(
                movieName,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              kVerticalSpace,
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        movieDescription,
                        style: const TextStyle(overflow: TextOverflow.fade),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }
}
