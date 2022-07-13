import 'package:flutter/material.dart';

import '../../../constants.dart';

class Username extends StatelessWidget {
  const Username({super.key, required this.width, required this.username});
  final double width;
  final String username;

  void onClicked() {}

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onClicked,
      child: SizedBox(
        width: width,
        child: Text(
          username,
          style: AppStyle.kContentBoldTextStyle,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
