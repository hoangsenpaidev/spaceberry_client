import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../constants.dart';

class ExpandableText extends StatefulWidget {
  const ExpandableText({super.key, required this.text, this.trimLines = 2});

  final String text;
  final int trimLines;

  @override
  ExpandableTextState createState() => ExpandableTextState();
}

class ExpandableTextState extends State<ExpandableText>
    with TickerProviderStateMixin {
  bool _readMore = true;
  void _onTap() {
    setState(() => _readMore = !_readMore);
  }

  @override
  Widget build(BuildContext context) {
    final Size textSize = (TextPainter(
            text: TextSpan(
              text: widget.text,
              style: AppStyle.kContentRegularTextStyle,
            ),
            maxLines: 1,
            textScaleFactor: MediaQuery.of(context).textScaleFactor,
            textDirection: TextDirection.ltr)
          ..layout())
        .size;
    final Size size = MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AnimatedSize(
          duration: const Duration(milliseconds: 150),
          curve: Curves.linearToEaseOut,
          child: Text(
            widget.text,
            style: AppStyle.kContentRegularTextStyle,
            maxLines: _readMore ? widget.trimLines : null,
            softWrap: true,
            overflow: TextOverflow.clip,
          ),
        ),
        GestureDetector(
          onTap: _onTap,
          child: size.width * 2 <= textSize.width && _readMore
              ? Text(
                  'Read more',
                  style: GoogleFonts.mulish(fontSize: 14, color: kPrimaryColor),
                )
              : const SizedBox(),
        ),
      ],
    );
  }
}
