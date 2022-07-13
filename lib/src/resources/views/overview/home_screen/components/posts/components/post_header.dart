import 'package:flutter/material.dart';

import '../../../../../../constants.dart';
import '../../../../components/avatar.dart';
import '../../../../components/icons/icon_btn.dart';
import '../../../../components/small_text.dart';
import '../../../../components/username.dart';

class PostHeader extends StatelessWidget {
  const PostHeader(
      {super.key,
      required this.image,
      required this.username,
      required this.postingTime});

  final String image;
  final String username;
  final String postingTime;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isTheme =
        MediaQuery.of(context).platformBrightness == Brightness.light;

    return Container(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 3),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 0.5,
            color: isTheme
                ? kContentColorLightTheme.withOpacity(0.1)
                : kContentColorDarkTheme.withOpacity(0.2),
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _headerLeft(size, isTheme, image, username, postingTime),
          _moreBtn()
        ],
      ),
    );
  }

  Widget _headerLeft(Size size, bool isTheme, String image, String username,
          String postingTime) =>
      Row(
        children: [
          const SizedBox(width: kDefaultPadding / 2),
          Avatar(size: 16.0, image: image),
          const SizedBox(width: kDefaultPadding / 2),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Username(
                username: username,
                width: size.width - 102,
              ),
              SmallText(text: postingTime)
            ],
          )
        ],
      );

  Widget _moreBtn() => Container(
        width: 40,
        height: 40,
        padding: const EdgeInsets.all(kDefaultPadding / 10),
        child: IconBtn(
          darkIcon: 'assets/icons/dark-theme/more-y.svg',
          lightIcon: 'assets/icons/light-theme/more-y.svg',
          pressed: () {},
        ),
      );
}
