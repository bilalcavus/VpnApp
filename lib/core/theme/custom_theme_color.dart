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

  // static Color homeContainerColor(BuildContext context) {
  //   return isDarkMode(context)
  //       ? Color(0xff1A5CFF)
  //       : Color.fromARGB(255, 9, 30, 83);
  // }

  static Color homeHeaderBackground(BuildContext context) {
    return isDarkMode(context)
        ? Color.fromARGB(255, 7, 18, 44)
        : Color(0xff1A5CFF);
  }

  static Color bottomNavBarColor(BuildContext context) {
    return isDarkMode(context)
        ? Color.fromARGB(255, 19, 19, 19)
        : Colors.white;
  }

   static Color bottomSheet(BuildContext context) {
    return isDarkMode(context)
        ? Colors.black
        : Colors.white;
  }

  static Color bottomSheetContainer(BuildContext context) {
    return isDarkMode(context)
        ? const Color.fromARGB(255, 19, 19, 19)
        : Colors.grey.shade100;
  }

  static Color languageChoosingColor(BuildContext context){
    return isDarkMode(context)
        ? const Color.fromARGB(255, 41, 45, 88)
        : const Color.fromARGB(255, 171, 171, 186);
  }

  static Color bottomSheetColor(BuildContext context){
    return isDarkMode(context)
        ? const Color(0xff121321)
        : const Color(0xffF0F0F0);
  }

  static Color bottomSheetContainerColor(BuildContext context){
    return isDarkMode(context)
        ? const Color(0xff21222A)
        : const Color(0xffE8E8E8);
  }


  static Color bottomSheetTextColor(BuildContext context){
    return isDarkMode(context)
        ? Colors.white
        : Colors.black;
  }

  static Color bottomSheetPassiveText(BuildContext context){
    return isDarkMode(context)
        ? const Color(0xffB7B7B7)
        : const Color(0xff555353);
  }


  static Color drawerHeaderColor(BuildContext context){
    return isDarkMode(context)
        ? const Color.fromARGB(255, 53, 50, 71)
        : const Color.fromARGB(255, 184, 184, 197);
  }
}
