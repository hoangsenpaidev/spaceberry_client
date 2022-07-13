import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key, required this.size, required this.image});
  final double size;
  final String image;

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: size,
      backgroundImage: NetworkImage(image),
    );
  }
}
