import 'package:flutter/material.dart';
import '../constants/colors.dart';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData(
      // Font family
      fontFamily: 'Gotham',
      
      // Primary colors
      primaryColor: AppColors.primaryOrange,
      scaffoldBackgroundColor: AppColors.background,
      
      // Color scheme
      colorScheme: ColorScheme.light(
        primary: AppColors.primaryOrange,
        secondary: AppColors.primaryDarkGray,
        surface: AppColors.primaryCream,
        background: AppColors.background,
      ),
      
      // AppBar theme
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primaryCream,
        elevation: 0,
        iconTheme: IconThemeData(color: AppColors.primaryDarkGray),
        titleTextStyle: TextStyle(
          fontFamily: 'Gotham',
          color: AppColors.primaryDarkGray,
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
      
      // Text theme with Gotham font
      textTheme: TextTheme(
        displayLarge: TextStyle(
          fontFamily: 'Gotham',
          fontSize: 32,
          fontWeight: FontWeight.bold,
          color: AppColors.textDark,
        ),
        displayMedium: TextStyle(
          fontFamily: 'Gotham',
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: AppColors.textDark,
        ),
        displaySmall: TextStyle(
          fontFamily: 'Gotham',
          fontSize: 20,
          fontWeight: FontWeight.w600,
          color: AppColors.textDark,
        ),
        headlineMedium: TextStyle(
          fontFamily: 'Gotham',
          fontSize: 18,
          fontWeight: FontWeight.bold,
          color: AppColors.textDark,
        ),
        bodyLarge: TextStyle(
          fontFamily: 'Gotham',
          fontSize: 16,
          fontWeight: FontWeight.normal,
          color: AppColors.textDark,
        ),
        bodyMedium: TextStyle(
          fontFamily: 'Gotham',
          fontSize: 14,
          fontWeight: FontWeight.normal,
          color: AppColors.textDark,
        ),
        bodySmall: TextStyle(
          fontFamily: 'Gotham',
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: AppColors.textDark,
        ),
        labelLarge: TextStyle(
          fontFamily: 'Gotham',
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color: AppColors.textDark,
        ),
      ),
      
      // Button theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.buttonPrimary,
          foregroundColor: AppColors.buttonText,
          padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          textStyle: TextStyle(
            fontFamily: 'Gotham',
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      
      // Input decoration theme
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: AppColors.primaryOrange.withOpacity(0.6),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
          borderSide: BorderSide(color: AppColors.primaryDarkGray, width: 2),
        ),
        contentPadding: EdgeInsets.symmetric(horizontal: 20, vertical: 15),
        labelStyle: TextStyle(
          fontFamily: 'Gotham',
          color: AppColors.textDark,
          fontWeight: FontWeight.w500,
        ),
        hintStyle: TextStyle(
          fontFamily: 'Gotham',
          color: AppColors.textDark.withOpacity(0.6),
        ),
      ),
      
      // Bottom Navigation Bar theme
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColors.primaryDarkGray,
        selectedItemColor: AppColors.primaryOrange,
        unselectedItemColor: AppColors.primaryOrange.withOpacity(0.5),
        type: BottomNavigationBarType.fixed,
        elevation: 8,
        selectedLabelStyle: TextStyle(
          fontFamily: 'Gotham',
          fontWeight: FontWeight.bold,
        ),
        unselectedLabelStyle: TextStyle(
          fontFamily: 'Gotham',
          fontWeight: FontWeight.normal,
        ),
      ),
    );
  }
}
