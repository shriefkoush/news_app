
import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';
import 'package:news_app/utils/app_styles.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    indicatorColor: AppColors.blackColor,
    primaryColor: AppColors.whiteColor,
    scaffoldBackgroundColor: AppColors.whiteColor,
    appBarTheme:  AppBarTheme(centerTitle: true,
    iconTheme: IconThemeData(
      color: AppColors.blackColor,
    ),
    backgroundColor: AppColors.whiteColor,
    ),
    textTheme: TextTheme(
      labelLarge: AppStyles.bold16black,
      labelMedium: AppStyles.medium14black,
      headlineLarge: AppStyles.medium20black,
        headlineMedium: AppStyles.medium24black

    )
  );

  static final ThemeData darkTheme = ThemeData(
      indicatorColor: AppColors.whiteColor,
      primaryColor: AppColors.blackColor,
    scaffoldBackgroundColor: AppColors.blackColor,
    appBarTheme:  AppBarTheme(centerTitle: true,
        iconTheme: IconThemeData(
          color: AppColors.whiteColor,
        ),
    backgroundColor:AppColors.blackColor ),
  textTheme: TextTheme(
  labelLarge: AppStyles.bold16white,
  labelMedium: AppStyles.medium14white,
      headlineLarge: AppStyles.medium20white,
      headlineMedium: AppStyles.medium24white

  )
  );
}