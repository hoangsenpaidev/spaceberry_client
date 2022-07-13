import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';

class BgImage extends StatelessWidget {
  const BgImage({super.key, required this.size, required this.imageUrl});
  final Size size;
  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size.width - kDefaultPadding * 2,
      height: 300,
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: SvgPicture.asset(
        imageUrl,
        fit: BoxFit.fitHeight,
      ),
    );
  }
}
