import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../utils/unicorn_outline.dart';

class BottomBarCustomIcon extends StatelessWidget {
  const BottomBarCustomIcon(
      {super.key,
      required this.size,
      required this.image,
      required this.pressed});
  final double size;
  final String image;
  final VoidCallback pressed;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: UnicornOutline(
        radius: 100,
        strokeWidth: 1.5,
        gradient: const LinearGradient(
          colors: [Color(0xFFFBAA47), Color(0xFFD91A46), Color(0xFFA60F93)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        onPressed: pressed,
        child: Container(
          padding: const EdgeInsets.all(3),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(100),
            child: image != ''
                ? Image.network(
                    'https://benhvienthammydonga.vn/wp-content/uploads/2022/06/$image',
                    fit: BoxFit.cover)
                : Image.asset('assets/images/avatar.png', fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
