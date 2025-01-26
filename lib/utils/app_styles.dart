import 'dart:ui';

import 'package:flutter/src/painting/text_style.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/utils/app_colors.dart';

class AppStyles {
  static TextStyle medium20white = GoogleFonts.inter(
    fontSize: 20,fontWeight: FontWeight.w500,color: AppColors.whiteColor
  );

  static TextStyle medium14white = GoogleFonts.inter(
      fontSize: 14,fontWeight: FontWeight.w500,color: AppColors.whiteColor
  );
  static TextStyle medium14black = GoogleFonts.inter(
      fontSize: 14,fontWeight: FontWeight.w500,color: AppColors.blackColor
  );
  static TextStyle medium20black = GoogleFonts.inter(
      fontSize: 20,fontWeight: FontWeight.w500,color: AppColors.blackColor
  );
  static TextStyle medium24white = GoogleFonts.inter(
      fontSize: 24,fontWeight: FontWeight.w500,color: AppColors.whiteColor
  );
  static TextStyle medium24black = GoogleFonts.inter(
      fontSize: 24,fontWeight: FontWeight.w500,color: AppColors.blackColor
  );
  static TextStyle medium12grey = GoogleFonts.inter(
      fontSize: 12,fontWeight: FontWeight.w500,color: AppColors.greyColor
  );

}