import 'package:flutter/material.dart';

class ThemeManager with ChangeNotifier {
  ThemeMode _themeMode = ThemeMode.light;
 ThemeMode get themeMode => _themeMode;

  toggletheme(bool isdark) {
    _themeMode = isdark ? ThemeMode.dark : ThemeMode.light;
    notifyListeners();
  }
}
