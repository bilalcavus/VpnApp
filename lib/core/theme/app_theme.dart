// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    primaryColor: const Color(0xff1A5CFF),
    scaffoldBackgroundColor: const Color(0xffF2F5F9),
    cardColor: Colors.black12,
    colorScheme: const ColorScheme.light(
      primaryContainer: Colors.white,
      onPrimaryContainer: Colors.black,
      brightness: Brightness.light
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.black),
      titleTextStyle: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      elevation: 0,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Color(0xffDFDFE7),
    ),
    buttonTheme: const ButtonThemeData(buttonColor: Color(0xFF6C63FF)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff1A5CFF),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Color(0xff1A5CFF),
      unselectedItemColor: Colors.black,
      backgroundColor: Colors.white,
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
      type: BottomNavigationBarType.fixed,
      elevation: 10,
    ),
    visualDensity: VisualDensity.adaptivePlatformDensity,
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 24),
      titleMedium: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      bodyLarge: TextStyle(color: Colors.black, fontSize: 16),
      bodyMedium: TextStyle(color: Colors.black87, fontSize: 14),
      labelLarge: TextStyle(color: Color(0xff1A5CFF), fontWeight: FontWeight.bold),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Color(0xffF0F0F0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    ),
  );

  static final ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    primaryColor: const Color(0xff1A5CFF),
    scaffoldBackgroundColor: Colors.black,
    cardColor: Colors.white12,
    colorScheme: const ColorScheme.dark(
      primaryContainer: Color.fromARGB(255, 19, 19, 19),
      onPrimaryContainer: Colors.white,
      brightness: Brightness.dark
    ),
    appBarTheme: const AppBarTheme(
      color: Colors.transparent,
      iconTheme: IconThemeData(color: Colors.white),
      titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      elevation: 0,
    ),
    drawerTheme: const DrawerThemeData(
      backgroundColor: Color(0xff3E4056),
    ),
    buttonTheme: const ButtonThemeData(buttonColor: Color(0xFF6C63FF)),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xff1A5CFF),
        foregroundColor: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedItemColor: Color(0xff1A5CFF),
      unselectedItemColor: Colors.white,
      backgroundColor: Color(0xFF1E2125),
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.w600),
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.normal),
      type: BottomNavigationBarType.fixed,
      elevation: 10,
    ),
    textTheme: const TextTheme(
      titleLarge: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 24),
      titleMedium: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
      bodyLarge: TextStyle(color: Colors.white, fontSize: 16),
      bodyMedium: TextStyle(color: Colors.white70, fontSize: 14),
      labelLarge: TextStyle(color: Color(0xff1A5CFF), fontWeight: FontWeight.bold),
    ),
    bottomSheetTheme: const BottomSheetThemeData(
      backgroundColor: Color(0xff090909),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
    ),
  );
}
