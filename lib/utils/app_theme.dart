
import 'package:flutter/material.dart';
import 'package:news_app/utils/app_colors.dart';

class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    primaryColor: AppColors.whiteColor,
    appBarTheme: const AppBarTheme(centerTitle: true, ),
  );

  static final ThemeData darkTheme = ThemeData(
    primaryColor: AppColors.blackColor,
    appBarTheme: const AppBarTheme(centerTitle: true, ),
  );
}