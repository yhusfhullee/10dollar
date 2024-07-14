import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:tendollarapp/core/constants/app_color.dart';

// ignore_for_file: sort_child_properties_last, prefer_const_constructors

class inActiveAppButton extends StatelessWidget {
  final String value;

  const inActiveAppButton({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 45,
        decoration: BoxDecoration(
          color: Colors.grey.shade500,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Center(
          child: Text(
            value,
            style: GoogleFonts.dmSans(
              color: AppColor.blueColor,
              fontSize: 20,
              fontWeight: FontWeight.w700,
            ),
          ),
        ),
      ),
    );
  }
}
