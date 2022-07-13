import 'package:flutter/material.dart';

import '../../../../../../constants.dart';
import '../../../../components/avatar.dart';
import '../../../../components/icons/icon_btn.dart';
import '../../../../components/small_text.dart';
import '../../../../components/username.dart';
import 'reply.dart';

List image = [
  // 'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
  // 'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
  // 'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
  // 'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
  // 'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
  'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
];

class CommentItem extends StatefulWidget {
  const CommentItem(e,
      {super.key,
      required this.image,
      required this.username,
      required this.conntent,
      required this.postingTime});

  final String image;
  final String username;
  final String conntent;
  final String postingTime;

  @override
  State<CommentItem> createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
  bool seeReplyStatus = false;

  void replyComment() {}

  void seeReply() => setState(() => seeReplyStatus = !seeReplyStatus);

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
          Avatar(size: 16, image: widget.image),
          const SizedBox(width: kDefaultPadding / 2),
          _commentBody(size, isTheme),
        ],
      ),
    );
  }

  Widget _commentBody(Size size, bool isTheme) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Username(
                  username: widget.username,
                  width: size.width - (32 + 32 + kDefaultPadding * 2),
                ),
                const SizedBox(height: kDefaultPadding / 4),
                SizedBox(
                  width: size.width - (32 + 32 + kDefaultPadding * 2),
                  child: Text(widget.conntent,
                      style: AppStyle.kContentRegularTextStyle),
                ),
                const SizedBox(height: kDefaultPadding / 4),
                Row(children: [
                  SmallText(text: widget.postingTime),
                  const SizedBox(width: kDefaultPadding),
                  const SmallText(text: '1 lượt thích'),
                  const SizedBox(width: kDefaultPadding),
                  GestureDetector(
                    onTap: replyComment,
                    child: const SmallText(text: 'Trả lời'),
                  )
                ]),
              ],
            ),
            const SizedBox(width: kDefaultPadding / 2),
            _likeCommentBtn()
          ]),
          const SizedBox(height: kDefaultPadding),
          AnimatedSize(
            duration: Duration(milliseconds: 70 * image.length),
            child: Container(
                constraints: seeReplyStatus
                    ? const BoxConstraints()
                    : const BoxConstraints(maxHeight: 0),
                child: Reply(commentId: '', image: image)),
          ),
          _seeReplyBtn(size, isTheme),
        ],
      );

  Widget _seeReplyBtn(Size size, bool isTheme) => GestureDetector(
        onTap: seeReply,
        child: Stack(
          children: [
            SizedBox(
              width: size.width - (32 + 32 + kDefaultPadding * 2),
              child: Divider(
                color: isTheme
                    ? kContentColorLightTheme.withOpacity(0.6)
                    : kContentColorDarkTheme.withOpacity(0.6),
                thickness: 0.5,
              ),
            ),
            Positioned(
              bottom: 1,
              left: (size.width -
                      (32 + 32 + kDefaultPadding * 2) -
                      (!seeReplyStatus ? 150 : 100)) /
                  2,
              child: Container(
                width: !seeReplyStatus ? 150 : 100,
                color:
                    !isTheme ? kContentColorLightTheme : kContentColorDarkTheme,
                child: Center(
                    child: SmallText(
                  text: !seeReplyStatus
                      ? 'Xem thêm 1 câu trả lời'
                      : 'Ẩn câu trả lời',
                )),
              ),
            ),
          ],
        ),
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
