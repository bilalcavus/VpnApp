import 'package:flutter/material.dart';

class CustomColorTheme {

  static Brightness getThemeBrightness(BuildContext context) {
    return Theme.of(context).brightness;
  }
  
  static bool isDarkMode(BuildContext context) {
    return getThemeBrightness(context) == Brightness.dark;
  }

  static Color iconContainerColor(BuildContext context) {
    return isDarkMode(context)
        ? Colors.grey.shade800
        : const Color(0xffF2F5F9 );
  }


  static Color homeHeaderBackground(BuildContext context) {
    return isDarkMode(context)
        ? const Color.fromARGB(255, 7, 18, 44)
        : const Color(0xff1A5CFF);
  }

  static Color bottomNavBarColor(BuildContext context) {
    return isDarkMode(context)
        ? const Color.fromARGB(255, 19, 19, 19)
        : Colors.white;
  }

  
}
