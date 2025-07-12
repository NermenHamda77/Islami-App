import 'package:flutter/material.dart';
import 'package:islami_app/my_theme/app_colors.dart';

class MyTheme{
  static final ThemeData lightMode = ThemeData(
      primaryColor: AppColors.primaryLightColor,
    scaffoldBackgroundColor: Colors.transparent,

    // ------------------------------------------------------------------------------

    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      elevation: 0,
      centerTitle: true,

    ),

    // ------------------------------------------------------------------------------

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      selectedIconTheme: IconThemeData(
        color: AppColors.blackColor,
        size: 16,
      ),
      selectedItemColor: AppColors.blackColor

    ),


    // ------------------------------------------------------------------------------

    textTheme: TextTheme(
      bodyLarge: TextStyle(
          fontSize: 30,
          color: AppColors.blackColor,
          fontWeight: FontWeight.bold
      ),

      bodyMedium: TextStyle(
          fontSize: 24,
          color: AppColors.blackColor,
          fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
          fontSize: 20,
          color: AppColors.blackColor,
          fontWeight: FontWeight.w700,

      ),

    ),

    // ------------------------------------------------------------------------------


  );
}