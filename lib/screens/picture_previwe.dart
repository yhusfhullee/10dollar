import 'package:flutter/material.dart';
import 'package:tendollarapp/screens/text_view.dart';
import 'package:tendollarapp/screens/Image_view.dart';

class Previwie extends StatelessWidget {
  final snap;
  final String type;
  const Previwie({super.key, required this.snap, required this.type});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: type == "text"
            ? TextViwe(
                snap: snap,
              )
            : type == "image"
                ? ImageView(
                    visiblity: "profile",
                    snap: snap,
                  )
                : null);
  }
}
