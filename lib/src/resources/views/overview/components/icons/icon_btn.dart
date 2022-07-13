import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../constants.dart';

class IconBtn extends StatelessWidget {
  const IconBtn(
      {super.key,
      required this.darkIcon,
      required this.lightIcon,
      required this.pressed});

  final String darkIcon;
  final String lightIcon;
  final VoidCallback pressed;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: pressed,
      icon: MediaQuery.of(context).platformBrightness == Brightness.light
          ? SvgPicture.asset(lightIcon, height: kIconSize, width: kIconSize)
          : SvgPicture.asset(darkIcon, height: kIconSize, width: kIconSize),
      highlightColor: Colors.transparent,
      focusColor: Colors.transparent,
      splashColor: Colors.transparent,
    );
  }
}
