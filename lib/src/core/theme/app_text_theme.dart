import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants/app_colors.dart';

class AppTextTheme {
  ///1.Heading Style
  ///2.InputText Style
  ///3.ButtonText Style

  //Heading Style
  static TextStyle heading1Style = GoogleFonts.poppins(
      fontSize: 24, fontWeight: FontWeight.bold, color: AppColors.headingColor);
  static TextStyle heading2Style = heading1Style.copyWith(fontSize: 22);

//InputText Style
  static TextStyle inputTextStyle = GoogleFonts.poppins(
      fontSize: 20, fontWeight: FontWeight.w300, color: AppColors.headingColor);

  // Button Style
  static TextStyle buttonTextStyle = GoogleFonts.poppins(
      fontSize: 18, fontWeight: FontWeight.w200, color: AppColors.backgroundColor);
}

