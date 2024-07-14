import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import '../core/constants/constant.dart';

class ProfilePicWidget extends StatefulWidget {
  final String url;
  final double height;
  final double width;
  final bool isgradient;
  const ProfilePicWidget(
      {super.key,
      required this.url,
      this.height = 50,
      this.width = 50,
      this.isgradient = true});

  @override
  State<ProfilePicWidget> createState() => _ProfilePicWidgetState();
}

class _ProfilePicWidgetState extends State<ProfilePicWidget> {
  bool isclick = false;
  var _cacheKey = "100";

  @override
  void initState() {
    super.initState();
    _refreshImage();
  }

  void _refreshImage() {
    // Generate a new UniqueKey to force the widget to rebuild
    setState(() {
      _cacheKey = DateTime.now().toIso8601String();
    });
  }

  generate() {
    _cacheKey = DateTime.now().toIso8601String();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.height,
      width: widget.width,
      padding: widget.isgradient ? EdgeInsets.all(5) : null,
      decoration: BoxDecoration(
          shape: BoxShape.circle,
          gradient: widget.isgradient
              ? LinearGradient(
                  colors: [
                    const Color.fromARGB(255, 254, 61, 61),
                    Color.fromARGB(255, 245, 198, 44)
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                )
              : null),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(60),
        child: CachedNetworkImage(
          cacheKey: _cacheKey,
          fit: BoxFit.cover,
          imageUrl: widget.url,
          placeholder: (context, url) => Image.asset(AppImage.profileholder),
          errorWidget: (context, url, error) =>
              Image.asset(AppImage.profileholder),
        ),
      ),
    );
  }
}
