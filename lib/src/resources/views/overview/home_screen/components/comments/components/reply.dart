import 'package:flutter/material.dart';

import '../../../../../../constants.dart';
import '../../../../components/avatar.dart';
import '../../../../components/icons/icon_btn.dart';
import '../../../../components/small_text.dart';
import '../../../../components/username.dart';

class Reply extends StatefulWidget {
  const Reply({super.key, required this.commentId, required this.image});
  final String commentId;
  final List image;

  @override
  State<Reply> createState() => _ReplyState();
}

class _ReplyState extends State<Reply> {
  @override
  Widget build(BuildContext context) {
    return Column(
        children: widget.image.map((e) => ReplyItem(e, image: e)).toList());
  }
}

class ReplyItem extends StatelessWidget {
  const ReplyItem(e, {super.key, required this.image});
  final String image;

  void replyComment() {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isTheme =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Avatar(size: 13, image: image),
          const SizedBox(width: kDefaultPadding / 2),
          _body(size, isTheme),
        ],
      ),
    );
  }

  Widget _body(Size size, bool isTheme) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Username(
                  username: 'Huy Hoang',
                  width: size.width - (32 + 32 + 36 + kDefaultPadding * 2),
                ),
                const SizedBox(height: kDefaultPadding / 4),
                SizedBox(
                  width: size.width - (32 + 32 + 36 + kDefaultPadding * 2),
                  child: Text(
                      'C?? m???t ng?????i l???ng l??? ?????ng b??n em v?? h??nh.. Gi???u ??i nh???ng t??m t?? c???a m??nh -  Ng?????i N??o ????, 2AM',
                      style: AppStyle.kContentRegularTextStyle),
                ),
                const SizedBox(height: kDefaultPadding / 4),
                Row(children: [
                  const SmallText(text: '1 ngay truoc'),
                  const SizedBox(width: kDefaultPadding),
                  const SmallText(text: '1 l?????t th??ch'),
                  const SizedBox(width: kDefaultPadding),
                  GestureDetector(
                    onTap: replyComment,
                    child: const SmallText(text: 'Tr??? l???i'),
                  )
                ]),
              ],
            ),
            const SizedBox(width: kDefaultPadding / 2),
            _likeCommentBtn()
          ]),
        ],
      );

  Widget _likeCommentBtn() => Container(
        width: 32,
        padding: const EdgeInsets.all(kDefaultPadding / 10),
        child: IconBtn(
          darkIcon: 'assets/icons/dark-theme/heart.svg',
          lightIcon: 'assets/icons/light-theme/heart.svg',
          pressed: () {},
        ),
      );
}
