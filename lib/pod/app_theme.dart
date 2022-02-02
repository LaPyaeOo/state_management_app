import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:state_management_app/util/app_color.dart';
import '../util/dimension.dart';

class AppTheme {
  static TextTheme textTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
      fontSize: TEXT_REGULAR,
      fontWeight: FontWeight.w700,
      color: AppColor().primaryFontColor,
    ),
    headline1: GoogleFonts.openSans(
      fontSize: TEXT_BIG,
      fontWeight: FontWeight.bold,
      color: AppColor().primaryFontColor,
    ),
    headline2: GoogleFonts.openSans(
      fontSize: TEXT_REGULAR_2X,
      fontWeight: FontWeight.bold,
      color: AppColor().primaryFontColor,
    ),
    headline3: GoogleFonts.openSans(
      fontSize: TEXT_REGULAR,
      fontWeight: FontWeight.w600,
      color: AppColor().primaryFontColor,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: TEXT_REGULAR_3X,
      fontWeight: FontWeight.w600,
      color: AppColor().primaryFontColor,
    ),
  );

  static ThemeData themeData() {
    return ThemeData(
      brightness: Brightness.light,
      appBarTheme: AppBarTheme(
        foregroundColor: Colors.black,
        backgroundColor: AppColor().primaryColor,
      ),
      textTheme: textTheme,
    );
  }
}

InputDecoration kTextFormFieldsDecoration(
    {double? fontSize, Color? kFontColor, FontWeight? fontWeight}) {
  return InputDecoration(
    errorStyle: TextStyle(
      fontSize: 10,
    ),
    isDense: true,
    contentPadding: EdgeInsets.fromLTRB(0, 8, 10, 0),
  );
}
