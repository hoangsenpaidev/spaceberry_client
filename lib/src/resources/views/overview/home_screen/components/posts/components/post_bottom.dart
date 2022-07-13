import 'package:flutter/material.dart';

import '../../../../../../constants.dart';
import 'expandable_text.dart';

class PostBottom extends StatelessWidget {
  const PostBottom({super.key, required this.caption, required this.likes});
  final String caption;
  final String likes;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _totalLikes(likes),
          const SizedBox(height: kDefaultPadding / 4),
          SizedBox(
            width: size.width,
            child: ExpandableText(text: caption, trimLines: 2),
          ),
          const SizedBox(height: kDefaultPadding / 4),
        ],
      ),
    );
  }

  Widget _totalLikes(String likes) =>
      Text('$likes lượt thích', style: AppStyle.kContentBoldTextStyle);
}
