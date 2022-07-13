import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants.dart';

class BackIcon extends StatelessWidget {
  const BackIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      padding: const EdgeInsets.all(kDefaultPadding / 2),
      child: IconButton(
        onPressed: () => Navigator.pop(context),
        icon: SvgPicture.asset('assets/icons/light-theme/arrow-back.svg',
            width: kIconSize, height: kIconSize),
        highlightColor: Colors.transparent,
        focusColor: Colors.transparent,
        splashColor: Colors.transparent,
      ),
    );
  }
}
