import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';

class AppBarTitle extends StatelessWidget {
  const AppBarTitle({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    bool isTheme =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    return Text(title,
        style: GoogleFonts.mulish(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: isTheme ? kContentColorLightTheme : kContentColorDarkTheme,
        ));
  }
}
