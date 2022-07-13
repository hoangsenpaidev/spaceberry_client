import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'views/overview/heart_screen/heart_screen.dart';
import 'views/overview/home_screen/home.dart';
import 'views/overview/person_screen/person_screen.dart';
import 'views/overview/reels_screen/reels_screen.dart';
import 'views/overview/search_screen/search_screen.dart';

const kPrimaryColor = Color(0xFFF2796B);
const kSecondaryColor = Color(0xFFFE9901);
const kContentColorLightTheme = Color(0xFF000000);
const kContentColorDarkTheme = Color(0xFFFFFFFF);

const kWarninngColor = Color(0xFFF2B40A);
const kErrorColor = Color(0xFFED1616);

const kDefaultPadding = 20.0;
const kDefaultBorderRadius = 10.0;
const kIconSize = 24.0;
const kIconActiveSize = 30.0;

List listScreens = [
  const ReelsScreen(),
  const SearchScreen(),
  const HomeScreen(),
  const HeartScreen(),
  const PersonScreen(),
];

final kGradientBoxDecoration = BoxDecoration(
  gradient: const LinearGradient(
    colors: [Colors.black, Colors.redAccent],
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
  ),
  borderRadius: BorderRadius.circular(32),
);

class AppStyle {
  static TextStyle kErrorTextStyle = GoogleFonts.mulish(
    fontSize: 15,
    color: kErrorColor,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
  );

  static TextStyle kStorieTextStyle = GoogleFonts.mulish(
    fontSize: 13,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
  );

  static TextStyle kContentLightTextStyle = GoogleFonts.mulish(
    fontSize: 15,
    fontWeight: FontWeight.w300,
    decoration: TextDecoration.none,
  );

  static TextStyle kContentRegularTextStyle = GoogleFonts.mulish(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
  );

  static TextStyle kContentBoldTextStyle = GoogleFonts.mulish(
    fontSize: 15,
    fontWeight: FontWeight.w700,
    decoration: TextDecoration.none,
  );
}

class AuthStyle {
  static TextStyle kLightThemeRegularTextStyle = GoogleFonts.mulish(
    fontSize: 15,
    color: kContentColorLightTheme.withOpacity(0.8),
    fontWeight: FontWeight.w400,
    decoration: TextDecoration.none,
  );

  static TextStyle kLightThemeBoldTextStyle = GoogleFonts.mulish(
    fontSize: 15,
    color: kContentColorLightTheme.withOpacity(0.8),
    fontWeight: FontWeight.w500,
    decoration: TextDecoration.none,
  );

  static OutlineInputBorder kNoBorder = OutlineInputBorder(
    borderSide: BorderSide.none,
    borderRadius: BorderRadius.circular(kDefaultBorderRadius),
  );

  static OutlineInputBorder kInputBorder = OutlineInputBorder(
    borderSide: const BorderSide(width: 1, color: kPrimaryColor),
    borderRadius: BorderRadius.circular(kDefaultBorderRadius),
  );
}
