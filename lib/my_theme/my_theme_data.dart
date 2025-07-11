import 'package:flutter/material.dart';
import 'package:islami_app/my_theme/app_colors.dart';

class MyTheme{
  static final ThemeData lightMode = ThemeData(
      primaryColor: AppColors.primaryLightColor,
    scaffoldBackgroundColor: Colors.transparent,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,

    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(
        fontSize: 30,
        color: AppColors.blackColor,
        fontWeight: FontWeight.bold
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        color: AppColors.blackColor,
        size: 16,
      ),
      selectedItemColor: AppColors.blackColor

    )
  );
}