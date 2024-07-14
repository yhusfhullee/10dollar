import 'package:flutter/material.dart';
import '../../core/constants/app_color.dart';
import '../../core/constants/app_styling.dart';

class Pallete {
  // Colors
  static const blackColor = Color.fromRGBO(1, 1, 1, 1); // primary color
  static const greyColor =
      Color.fromARGB(255, 179, 193, 200); // secondary color
  static const drawerColor = Color.fromARGB(255, 0, 0, 0);
  static const DarkCardColor = Color.fromARGB(255, 27, 23, 23);
  static const whiteColor = Color.fromARGB(255, 255, 250, 250);
  static var blueColor = Color.fromARGB(255, 209, 226, 239);

  // Themes
  static var darkModeAppTheme = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: blackColor,
    appBarTheme: AppBarTheme(
      elevation: 0,
      titleTextStyle: AppTextTheme.heading2(),
      backgroundColor: Colors.transparent,
      iconTheme: IconThemeData(
        color: whiteColor,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: drawerColor,
    ),
    primaryColor: AppColor.primaryColor,
  );

  static var lightModeAppTheme = ThemeData.light().copyWith(
    scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      titleTextStyle: AppTextTheme.heading2(),
      iconTheme: IconThemeData(
        color: blackColor,
      ),
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: whiteColor,
    ),
    primaryColor: Color.fromRGBO(30, 62, 87, 1),
    buttonTheme: ButtonThemeData(
      buttonColor: Color.fromRGBO(30, 62, 87, 1),
    ),
    //colorScheme: ColorScheme(background: whiteColor),
  );
}
