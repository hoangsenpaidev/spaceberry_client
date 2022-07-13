import 'package:flutter/material.dart';

import '../../../../../constants.dart';
import '../../../components/appbar_title.dart';
import '../../../components/avatar.dart';
import '../../../components/icons/icon_btn.dart';
import '../../../components/small_text.dart';
import '../../../components/username.dart';
import 'components/comment_item.dart';
import 'components/send_comment_form.dart';

class CommentScreen extends StatefulWidget {
  const CommentScreen(
      {super.key,
      required this.postId,
      required this.avatar,
      required this.username,
      required this.caption,
      required this.postingTime});

  final String postId;
  final String avatar;
  final String username;
  final String caption;
  final String postingTime;

  @override
  State<CommentScreen> createState() => _CommentScreenState();
}

class _CommentScreenState extends State<CommentScreen> {
  final TextEditingController _commentController = TextEditingController();
  List image = [
    'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
    'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
    'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
    'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
    'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    bool isTheme =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    return Scaffold(
      appBar: _buildAppBar(context),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: _buildBody(size, isTheme, image),
          ),
          SendCommentForm(
            controller: _commentController,
            onPressed: () {},
          ),
        ],
      ),
    );
  }

  AppBar _buildAppBar(BuildContext context) => AppBar(
        leading: _arrowBackBtn(context),
        title: const AppBarTitle(title: 'Comments'),
        actions: [_appBarShareBtn()],
        toolbarHeight: 60,
      );

  Widget _arrowBackBtn(BuildContext context) => Padding(
        padding: const EdgeInsets.all(kDefaultPadding / 2),
        child: IconBtn(
          darkIcon: 'assets/icons/dark-theme/arrow-back.svg',
          lightIcon: 'assets/icons/light-theme/arrow-back.svg',
          pressed: () => Navigator.pop(context),
        ),
      );

  Widget _appBarShareBtn() => IconBtn(
        darkIcon: 'assets/icons/dark-theme/share.svg',
        lightIcon: 'assets/icons/light-theme/share.svg',
        pressed: () {},
      );

  Widget _buildBody(Size size, bool isTheme, List image) => Container(
        constraints: const BoxConstraints.expand(),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: kDefaultPadding / 2),
            child: Column(
              children: [
                _header(size, isTheme),
                Column(
                  children: image
                      .map((e) => CommentItem(
                            e,
                            image: e,
                            username: 'Ngoc Phong',
                            conntent:
                                'Tên bài hát : Lữ khách qua thời gia Nội dung của bài hát: đám cưới ma ,bi thảm nói về sự buồn bả đau khổ ,xúc động cho người nghe cảm thấy rất dễ chịu ,lúc đầu tiếng chim kiêu tiếng sóng dào dạt ,nói chung là rất ấn tượng',
                            postingTime: '2 years ago',
                          ))
                      .toList(),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _header(Size size, bool isTheme) => Container(
        padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              width: 0.5,
              color: isTheme
                  ? kContentColorLightTheme.withOpacity(0.1)
                  : kContentColorDarkTheme.withOpacity(0.2),
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Avatar(size: 16, image: widget.avatar),
            const SizedBox(width: kDefaultPadding / 2),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Username(
                  username: widget.username,
                  width: size.width - (32 + kDefaultPadding * 1.5),
                ),
                SizedBox(
                  width: size.width - (32 + kDefaultPadding * 1.5),
                  child: Text(
                    widget.caption,
                    style: AppStyle.kContentRegularTextStyle,
                  ),
                ),
                SmallText(text: widget.postingTime)
              ],
            ),
          ],
        ),
      );
}
