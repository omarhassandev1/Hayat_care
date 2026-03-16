import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hayat_care/core/theme/app_colors.dart';

class AppTheme {
  static String getFontFamily(String languageCode) {
    return languageCode == 'ar' ? 'Cairo' : 'poppins';
  }

  static ThemeData getLightTheme(String langCode) {
    String fontFamily = getFontFamily(langCode);

    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.mainColor,
        primary: AppColors.mainColor,
      ),
      brightness: Brightness.light,
      fontFamily: fontFamily,
      scaffoldBackgroundColor: const Color(0xffFFFAFA),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: AppColors.blackColor,
      ),
      tabBarTheme: TabBarThemeData(

        labelColor: AppColors.mainColor,
        labelStyle: TextStyle(
          color: AppColors.mainColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
        ),
        unselectedLabelColor: AppColors.greyColor,
        unselectedLabelStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
        ),
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: AppColors.mainColor,width: 3.h),
        ),
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          color: AppColors.blackColor,
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
          fontFamily: fontFamily,
        ),
        titleSmall: TextStyle(
          color: AppColors.blackColor,
          fontSize: 12.sp,
          fontWeight: FontWeight.w800,
          fontFamily: fontFamily,
        ),
        bodySmall: TextStyle(
          color: AppColors.blackColor,
          fontSize: 13.sp,
          fontWeight: FontWeight.normal,
          fontFamily: fontFamily,
        ),
        bodyMedium: TextStyle(
          color: AppColors.blackColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          fontFamily: fontFamily,
        ),
        labelMedium: TextStyle(
          color: AppColors.blackColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
        ),
        labelSmall: TextStyle(
          color: AppColors.blackColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: Colors.white,
      ),
      dividerColor: Colors.black,
    );
  }

  static ThemeData getDarkTheme(String langCode) {
    String fontFamily = getFontFamily(langCode);

    return ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.mainColor,
        primary: AppColors.mainColor, brightness: Brightness.dark
      ),
      brightness: Brightness.dark,
      fontFamily: fontFamily,
      scaffoldBackgroundColor: const Color(0xff121212),
      appBarTheme: const AppBarTheme(
        elevation: 0,
        backgroundColor: Colors.transparent,
        foregroundColor: Colors.white,
      ),
      tabBarTheme: TabBarThemeData(
        labelColor: AppColors.mainColor,
        labelStyle: TextStyle(
          color: AppColors.mainColor,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
        ),
        unselectedLabelColor: AppColors.greyColor,
        unselectedLabelStyle: TextStyle(
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
        ),
        indicator: UnderlineTabIndicator(
          borderSide: BorderSide(color: AppColors.mainColor,width: 3.h),
        ),
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(
          color: Colors.white,
          fontSize: 24.sp,
          fontWeight: FontWeight.w700,
          fontFamily: fontFamily,
        ),
        titleSmall: TextStyle(
          color: Colors.white,
          fontSize: 12.sp,
          fontWeight: FontWeight.w800,
          fontFamily: fontFamily,
        ),
        bodySmall: TextStyle(
          color: Colors.white,
          fontSize: 13.sp,
          fontWeight: FontWeight.normal,
          fontFamily: fontFamily,
        ),
        bodyMedium: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w500,
          fontFamily: fontFamily,
        ),
        labelMedium: TextStyle(
          color: Colors.white,
          fontSize: 20.sp,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
        ),
        labelSmall: TextStyle(
          color: Colors.white,
          fontSize: 16.sp,
          fontWeight: FontWeight.w600,
          fontFamily: fontFamily,
        ),
      ),
      inputDecorationTheme: const InputDecorationTheme(
        filled: true,
        fillColor: AppColors.darkTextFieldFillColor,
      ),
      dividerColor: Colors.white,
    );
  }
}
