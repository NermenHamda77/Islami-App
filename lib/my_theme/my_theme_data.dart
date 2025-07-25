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
      iconTheme: IconThemeData(
        color: AppColors.blackColor,
      )

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
          fontSize: 25,
          color: AppColors.blackColor,
          fontWeight: FontWeight.w700,
      ),
      bodySmall: TextStyle(
          fontSize: 20,
          color: AppColors.blackColor,
          fontWeight: FontWeight.w500,

      ),
      titleLarge: TextStyle(
        fontSize: 20,
        color: AppColors.blackColor,
        fontWeight: FontWeight.w400,

      ),

    ),

    // ------------------------------------------------------------------------------


  );

  static final ThemeData darkMode = ThemeData(
    primaryColor: AppColors.primaryDarkColor,
    scaffoldBackgroundColor: Colors.transparent,

    // ------------------------------------------------------------------------------

    appBarTheme: AppBarTheme(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: AppColors.whiteColor,
        )

    ),

    // ------------------------------------------------------------------------------

    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        selectedIconTheme: IconThemeData(
          color: AppColors.yellowColor,
          size: 16,
        ),
        selectedItemColor: AppColors.yellowColor

    ),


    // ------------------------------------------------------------------------------

    textTheme: TextTheme(
      bodyLarge: TextStyle(
          fontSize: 30,
          color: AppColors.whiteColor,
          fontWeight: FontWeight.bold
      ),

      bodyMedium: TextStyle(
        fontSize: 25,
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w700,
      ),
      bodySmall: TextStyle(
        fontSize: 20,
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w500,

      ),
      titleLarge: TextStyle(
        fontSize: 20,
        color: AppColors.yellowColor,
        fontWeight: FontWeight.w400,

      ),

    ),

    // ------------------------------------------------------------------------------


  );

}