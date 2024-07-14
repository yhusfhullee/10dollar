import 'package:flutter/material.dart';
import '../core/constants/constant.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:auto_size_text/auto_size_text.dart';

class TextViwe extends StatelessWidget {
  final String snap;
  const TextViwe({super.key, required this.snap});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: AppColor.blueColor,
          leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(
              Icons.arrow_back_ios,
              color: AppColor.whiteColor,
            ),
          ),
        ),
        body: Stack(
          children: [
            Center(
                child: Container(
                    color: AppColor.blueColor,
                    width: double.infinity,
                    child: Center(
                      child: AutoSizeText(
                        snap,
                        style: GoogleFonts.dmSans(
                            fontSize: 30, color: AppColor.whiteColor),
                        minFontSize: 16,
                        maxLines: 10,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ))),
            Positioned(
              right: 0,
              bottom: 50,
              child: Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // RoundedButton(
                    //   icon: Icons.favorite,
                    //   onPressed: () {
                    //     // Handle like button press
                    //   },
                    // ),
                    // RoundedButton(
                    //   icon: Icons.share,
                    //   onPressed: () {
                    //     // Handle share button press
                    //   },
                    // ),
                    // RoundedButton(
                    //   icon: Icons.comment,
                    //   onPressed: () {
                    //     // Handle comment button press
                    //   },
                    // ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
