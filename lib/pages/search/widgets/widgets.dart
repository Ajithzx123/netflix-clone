import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../Constants/Colors/Colors.dart';
import '../../../api/tmdb_api.dart';
import '../../../constants/widgets/constant_widgets.dart';

class SearchTitle extends StatelessWidget {
  const SearchTitle({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 19,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}

class SearchListTile extends StatelessWidget {
  const SearchListTile({Key? key, required this.image, required this.title})
      : super(key: key);

  final String image;
  final String title;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
          width: screenWidth * 0.33,
          height: 60,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            image: DecorationImage(
              image: NetworkImage('${TMDB.imageId}$image'),
              fit: BoxFit.cover,
            ),
          ),
        ),
        kHorizontalSpace,
        Expanded(
          child: Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        const CircleAvatar(
          radius: 20,
          backgroundColor: backgroundWhite,
          child: CircleAvatar(
            radius: 18,
            backgroundColor: backgroundBlack,
            child: Padding(
              padding: EdgeInsets.only(left: 3),
              child: Icon(
                CupertinoIcons.play_fill,
                color: backgroundWhite,
              ),
            ),
          ),
        )
      ],
    );
  }
}

class SearchGridTile extends StatelessWidget {
  const SearchGridTile({Key? key, required this.image}) : super(key: key);

  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        image: DecorationImage(
          image: NetworkImage('${TMDB.imageId}$image'),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
