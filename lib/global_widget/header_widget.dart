import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tendollarapp/core/constants/app_color.dart';

class HeaderWidget extends StatelessWidget {
  final String subTitle;
  const HeaderWidget({Key? key, required this.subTitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.09,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.arrow_back_ios,
                  size: 20,
                  color: AppColor.whiteColor,
                ),
              ),
              const Spacer(),
              Text(
                subTitle,
                style: GoogleFonts.dmSans(
                  color: AppColor.whiteColor,
                  fontSize: 20,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
