import 'package:flutter/material.dart';

// import 'package:flutter/services.dart';

import 'app_theme_class.dart';

class Themes {
  static ThemeData lightTheme = ThemeData(
      fontFamily: 'SF-Pro',
      colorScheme: const ColorScheme.light(
        primary: AppTheme.primaryColors,
        secondary: AppTheme.neutralColors,
        onError: AppTheme.dangerColors,
        tertiary: AppTheme.successColors,
      ),
      dividerColor: AppTheme.neutralColors[200],
      textTheme: TextTheme(
        headlineLarge: TextStyle(
            fontWeight: AppTheme.mediumWeight,
            fontSize: AppTheme.fontHeadLarge),
        headlineMedium: TextStyle(
            color: AppTheme.neutralColors[900],
            fontWeight: AppTheme.mediumWeight,
            fontSize: AppTheme.fontHeadMedium),
        headlineSmall: TextStyle(
            fontWeight: AppTheme.mediumWeight,
            fontSize: AppTheme.fontHeadSmall),
        titleLarge: TextStyle(
            fontWeight: AppTheme.mediumWeight,
            fontSize: AppTheme.fontTitleLarge),
        titleMedium: TextStyle(
            fontWeight: AppTheme.mediumWeight,
            fontSize: AppTheme.fontTitleMedium),
        displayLarge: TextStyle(
            color: AppTheme.neutralColors[500],
            fontWeight: AppTheme.regulerWeight,
            fontSize: AppTheme.displayLarge),
        displayMedium: TextStyle(
            color: AppTheme.neutralColors[400],
            fontWeight: AppTheme.regulerWeight,
            fontSize: AppTheme.displayMedium),
        displaySmall: TextStyle(
            color: AppTheme.neutralColors[600],
            fontWeight: AppTheme.regulerWeight,
            fontSize: AppTheme.displaySmall),
      )


      );
}

