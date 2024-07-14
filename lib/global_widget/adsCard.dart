import 'package:flutter/material.dart';
import 'package:tendollarapp/core/constants/app_images.dart';

class adsCard extends StatelessWidget {
  const adsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Container(
        height: 150,
        width: double.infinity,
        child: Center(
          child: Text(
            " 10 dollar Musics",
            style: TextStyle(
              fontFamily: font,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
