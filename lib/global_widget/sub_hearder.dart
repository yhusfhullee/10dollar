import 'package:flutter/material.dart';
import 'package:tendollarapp/core/constants/app_images.dart';

class subMusicheading extends StatelessWidget {
  final String title;
  final String actiontitle;
  const subMusicheading(
      {Key? key, required this.title, required this.actiontitle})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          title,
          style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w800,
              fontFamily: font,
              letterSpacing: 1.5),
        ),
        Padding(
          padding: const EdgeInsets.all(20).copyWith(bottom: 4),
          child: Text(
            actiontitle,
            style: TextStyle(
              fontSize: 17,
              fontFamily: font,
              letterSpacing: 1.5,
            ),
          ),
        ),
      ],
    );
  }
}
