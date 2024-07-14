import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tendollarapp/core/constants/constant.dart';
// ignore_for_file: sort_child_properties_last, prefer_const_constructors

class AppButton extends StatelessWidget {
  final String value;
  final VoidCallback? onPressed;
  final Color color;
  final Color? textcolor;
  final double fontSize;
  AppButton(
      {super.key,
      this.color = AppColor.primaryColor, //AppColor.whiteColor,
      this.textcolor = Colors.black, // AppColor.blueColor,
      required this.onPressed,
      this.fontSize = 18,
      this.value = "Continue"});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: 40.h,
        padding: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Center(
          child: Text(value, style: AppTextTheme.body()),
        ),
      ),
    );
  }
}
