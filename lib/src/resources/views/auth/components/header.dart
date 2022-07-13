import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';

class Header extends StatelessWidget {
  const Header(
      {super.key,
      required this.text,
      required this.slogan,
      required this.icon});
  final String icon;
  final String text;
  final String slogan;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          Text(
            text,
            style: GoogleFonts.mulish(
              fontSize: 18,
              color: kContentColorLightTheme,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(width: 3),
          SizedBox(height: 20, width: 20, child: SvgPicture.asset(icon))
        ]),
        SizedBox(
          width: size.width - kDefaultPadding * 2 - 40,
          child: Text(slogan, style: AuthStyle.kLightThemeRegularTextStyle),
        )
      ],
    );
  }
}
