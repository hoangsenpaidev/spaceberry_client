import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';

class Button extends StatelessWidget {
  const Button({
    super.key,
    required this.text,
    required this.backgroundColor,
    required this.press,
    required this.width,
    this.disabled = false,
    // required this.height,
  });

  final bool disabled;
  final double width;
  final String text;
  final Color backgroundColor;
  final Function press;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      child: ElevatedButton(
        onPressed: !disabled ? () => press() : null,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.resolveWith<Color>(
            (Set<MaterialState> states) {
              if (disabled) return backgroundColor.withOpacity(0.6);
              return backgroundColor; // Use the component's default.
            },
          ),
          elevation: MaterialStateProperty.all<double>(0),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(kDefaultBorderRadius),
            ),
          ),
          padding: MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
            (Set<MaterialState> states) => const EdgeInsets.symmetric(
                horizontal: kDefaultPadding, vertical: kDefaultPadding / 1.5),
          ),
        ),
        child: Center(
          child: Text(text,
              style: GoogleFonts.outfit(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.w400,
              )),
        ),
      ),
    );
  }
}
