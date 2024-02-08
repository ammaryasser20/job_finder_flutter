import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AppTheme {
  static const int primaryColor = 0xFF3366FF;
  static const MaterialColor primaryColors = MaterialColor(
    primaryColor,
    <int, Color>{
      100: Color(0xFFD6E4FF),
      200: Color(0xFFADC8FF),
      300: Color(0xFF84A9FF),
      400: Color(0xFF6690FF),
      500: Color(primaryColor),
      600: Color(0xFF254EDB),
      700: Color(0xFF1939B7),
      800: Color(0xFF102693),
      900: Color(0xFF091A7A),
    },
  );
  //Color c = Color(0xFF1F2937);
  static const int neutralColor = 0xFF6B7280;
  static const MaterialColor neutralColors = MaterialColor(
    neutralColor,
    <int, Color>{
      100: Color(0xFFF4F4F5),
      200: Color(0xFFE5E7EB),
      300: Color(0xFFD1D5DB),
      400: Color(0xFF9CA3AF),
      500: Color(neutralColor),
      600: Color(0xFF4B5563),
      700: Color(0xFF374151),
      800: Color(0xFF1F2937),
      900: Color(0xFF111827),
    },
  );
  static const int successColor = 0xFF60C631;
  static const MaterialColor successColors = MaterialColor(
    successColor,
    <int, Color>{
      100: Color(0xFFECFCD6),
      200: Color(0xFFD4F9AE),
      300: Color(0xFFB2ED82),
      400: Color(0xFF8FDC60),
      500: Color(successColor),
      600: Color(0xFF45AA23),
      700: Color(0xFF2E8E18),
      800: Color(0xFF1B720F),
      900: Color(0xFF0D5F09),
    },
  );
  static const int dangerColor = 0xFFFF472B;
  static const MaterialColor dangerColors = MaterialColor(
    dangerColor,
    <int, Color>{
      100: Color(0xFFFFE7D4),
      200: Color(0xFFFFC9AA),
      300: Color(0xFFFFA47F),
      400: Color(0xFFFF8160),
      500: Color(dangerColor),
      600: Color(0xFFDB291F),
      700: Color(0xFFB71519),
      800: Color(0xFF930D1B),
      900: Color(0xFF7A081D),
    },
  );
  // static const Color primaryColo11r= Color.fromRGBO(255, 71, 43, 1);
//  static const Color neutralColor = Color(0xFF111827);
  // static const Color successColor = Color(0xFF0D5F09);
  static const Color informationColor = Color(0xFF02337A);
  static const Color warningColor = Color(0xFF7A5D03);
  // static const Color dangerColor = Color(0xFF7A081D);
  static const FontWeight regulerWeight = FontWeight.w400;
  static const FontWeight mediumWeight = FontWeight.w500;
  static const FontWeight boldWeight = FontWeight.bold;
  static double fontHeadLarge = 25.sp;
  static double fontHeadMedium = 24.sp;
  static double fontHeadSmall = 20.sp;
  static double fontTitleLarge = 18.sp;
  static double fontTitleMedium = 16.sp;
  static double displayLarge = 13.sp;
  static double displayMedium = 12.sp;
  static double displaySmall = 10.sp;
}
