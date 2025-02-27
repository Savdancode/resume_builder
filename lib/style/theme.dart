import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:hexcolor/hexcolor.dart';

class Apptheme {
  final _darkTheme = ThemeData.dark().copyWith(
    primaryColor: HexColor('#2e2d2d'),
    scaffoldBackgroundColor: HexColor('#2e2d2d'),
    appBarTheme: AppBarTheme(
      color: HexColor("#141414"),
      elevation: 5,
      titleTextStyle: const TextStyle(
        color: Colors.white,
        fontSize: 18,
      ),
      iconTheme: const IconThemeData(
        color: Colors.white,
      ),
    ),
    iconTheme: const IconThemeData(color: Colors.white),
    colorScheme: ColorScheme.dark(
      primary: HexColor('#2e2d2d'),
      secondary: HexColor('#999999'),
      surface: HexColor('#2e2d2d'),
      error: Colors.red,
      onPrimary: Colors.white,
      onSurface: Colors.grey[200]!.withAlpha(30),
      brightness: Brightness.dark,
      shadow: const Color.fromARGB(255, 176, 168, 168).withValues(alpha: 0.08),
      tertiary: Colors.blue.withAlpha(150),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: HexColor("#141414"),
      elevation: 5,
      type: BottomNavigationBarType.fixed,
    ),
  );

  final _lightTheme = ThemeData.light().copyWith(
    primaryColor: Colors.white,
    scaffoldBackgroundColor: HexColor('#fafafa'),
    splashColor: Colors.white,
    iconTheme: const IconThemeData(
      color: Colors.black87,
    ),
    appBarTheme: AppBarTheme(
      elevation: 0.2,
      color: HexColor('#ffffff'),
      shadowColor: HexColor('#ffffff'),
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      titleTextStyle: const TextStyle(
        color: Colors.black,
        fontSize: 18,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.blue.withAlpha(150),
        shadowColor: null,
        elevation: 0,
        textStyle: const TextStyle(
          color: Colors.black,
          fontSize: 16,
        ),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: HexColor('#ffffff'),
      elevation: 5,
    ),
    colorScheme: ColorScheme.light(
      primary: HexColor('#2e2d2d'),
      secondary: HexColor('#2e2d2d'),
      surface: HexColor('#2e2d2d'),
      error: Colors.red,
      onPrimary: Colors.black,
      onSurface: Colors.white,
      brightness: Brightness.dark,
      shadow: const Color(0xff000000).withValues(alpha: 0.08),
      tertiary: Colors.blue,
    ),
  );

  ThemeData get lightTheme => _lightTheme;
  ThemeData get darkTheme => _darkTheme;

  void switchTheme() {
    if (Get.isDarkMode) {
      Get.changeTheme(lightTheme);
    } else {
      Get.changeTheme(darkTheme);
    }
  }
}
