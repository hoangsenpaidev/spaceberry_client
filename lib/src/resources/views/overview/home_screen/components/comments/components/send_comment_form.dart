import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import '../../../../../../constants.dart';
import '../../../../components/avatar.dart';

class SendCommentForm extends StatelessWidget {
  const SendCommentForm({
    super.key,
    required this.controller,
    required this.onPressed,
  });

  final TextEditingController controller;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isTheme =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    return Container(
      height: 50,
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            width: 0.5,
            color: isTheme
                ? kContentColorLightTheme.withOpacity(0.2)
                : kContentColorDarkTheme.withOpacity(0.2),
          ),
        ),
      ),
      child: Row(
        children: [
          const Avatar(
            size: 16,
            image: 'https://taimienphi.vn/tmp/cf/aut/anh-gai-xinh-1.jpg',
          ),
          const SizedBox(width: kDefaultPadding / 2),
          _buildInput(size),
          const SizedBox(width: kDefaultPadding / 2),
          _buildSendBtn()
        ],
      ),
    );
  }

  Widget _buildInput(Size size) => SizedBox(
        height: 50,
        width: size.width - (64 + kDefaultPadding * 2),
        child: TextField(
          controller: controller,
          maxLength: 400,
          cursorHeight: 20,
          style: AppStyle.kContentRegularTextStyle,
          textInputAction: TextInputAction.send,
          decoration: InputDecoration(
            counterText: '',
            hintText: 'Thêm bình luận',
            hintStyle: AppStyle.kContentRegularTextStyle,
            contentPadding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding / 2, vertical: kDefaultPadding / 2),
            focusedBorder:
                const OutlineInputBorder(borderSide: BorderSide.none),
            enabledBorder:
                const OutlineInputBorder(borderSide: BorderSide.none),
          ),
        ),
      );

  Widget _buildSendBtn() => SizedBox(
        height: 50,
        width: 32,
        child: Center(
          child: Transform.rotate(
            angle: 45 * math.pi / 180,
            child: IconButton(
              onPressed: onPressed,
              highlightColor: Colors.transparent,
              focusColor: Colors.transparent,
              splashColor: Colors.transparent,
              icon: const Icon(CupertinoIcons.paperplane_fill),
            ),
          ),
        ),
      );
}
