import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';

class SmallText extends StatelessWidget {
  const SmallText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    bool isTheme =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    return Text(text,
        style: GoogleFonts.mulish(
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: isTheme
              ? kContentColorLightTheme.withOpacity(0.7)
              : kContentColorDarkTheme.withOpacity(0.7),
        ));
  }
}
