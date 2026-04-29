import 'package:flutter/material.dart';
import 'package:spotify_app/core/configs/theme/app_colors.dart';

class AppTheme {
  static final lightTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.lightBackground,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      contentPadding: EdgeInsets.symmetric(horizontal: 25, vertical: 20),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(color: AppColors.textFieldBorderLightColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(color: AppColors.textFieldBorderLightColor),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(color: Colors.redAccent),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(color: Colors.redAccent, width: 2),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 30,
        color: AppColors.titleLargeLightColor,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 17,
        color: AppColors.titleMediumLightColor,
        fontWeight: FontWeight.normal,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        color: AppColors.titleSmallLightColor,
        fontWeight: FontWeight.normal,
      ),
      bodyLarge: TextStyle(
        fontSize: 26,
        color: AppColors.bodyLargeLightColor,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: AppColors.bodyMediumLightColor,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        color: AppColors.bodySmallLightColor,
        fontWeight: FontWeight.normal,
      ),
      labelMedium: TextStyle(
        fontSize: 20,
        color: AppColors.textButtonTextLightColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    brightness: Brightness.light,
    fontFamily: "Satoshi",
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.lightBackground,
        textStyle: TextStyle(
          color: AppColors.lightBottomNavColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),
  );

  static final darkTheme = ThemeData(
    primaryColor: AppColors.primaryColor,
    scaffoldBackgroundColor: AppColors.darkBackground,
    inputDecorationTheme: InputDecorationTheme(
      filled: true,
      fillColor: Colors.transparent,
      contentPadding: EdgeInsets.all(20),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(color: AppColors.textFieldBorderDarkColor),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(color: AppColors.textFieldBorderDarkColor),
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(color: AppColors.primaryColor),
      ),

      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(color: Colors.redAccent),
      ),

      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
        borderSide: BorderSide(color: Colors.redAccent, width: 2),
      ),
    ),
    textTheme: TextTheme(
      titleLarge: TextStyle(
        fontSize: 30,
        color: AppColors.titleLargeDarkColor,
        fontWeight: FontWeight.bold,
      ),
      titleMedium: TextStyle(
        fontSize: 17,
        color: AppColors.titleMediumDarkColor,
        fontWeight: FontWeight.normal,
      ),
      labelMedium: TextStyle(
        fontSize: 20,
        color: AppColors.textButtonTextDarkColor,
        fontWeight: FontWeight.bold,
      ),
      titleSmall: TextStyle(
        fontSize: 14,
        color: AppColors.titleSmallDarkColor,
        fontWeight: FontWeight.normal,
      ),
      bodyLarge: TextStyle(
        fontSize: 26,
        color: AppColors.bodyLargeDarkColor,
        fontWeight: FontWeight.bold,
      ),
      bodyMedium: TextStyle(
        fontSize: 16,
        color: AppColors.bodyMediumDarkColor,
        fontWeight: FontWeight.bold,
      ),
      bodySmall: TextStyle(
        fontSize: 12,
        color: AppColors.bodySmallDarkColor,
        fontWeight: FontWeight.bold,
      ),
    ),
    brightness: Brightness.dark,
    fontFamily: "Satoshi",
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primaryColor,
        foregroundColor: AppColors.lightBackground,
        textStyle: TextStyle(
          color: AppColors.lightBottomNavColor,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
      ),
    ),
  );
}
