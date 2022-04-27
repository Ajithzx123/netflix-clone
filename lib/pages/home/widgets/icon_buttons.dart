import 'package:flutter/material.dart';
import 'package:netflix/Constants/Colors/Colors.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    Key? key,
    required this.icon,
    required this.title,
  }) : super(key: key);
  final IconData icon;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Icon(
          icon,
          color: backgroundWhite,
          size: 23,
        ),
        Text(title),
      ],
    );
  }
}
