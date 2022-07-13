import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../constants.dart';
import '../components/icons/icon_btn.dart';
import 'components/posts/posts.dart';
import 'components/stories.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    List image = [
      'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
      'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
      'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
      'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
      'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
    ];
    bool isTheme =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    return Scaffold(
      appBar: buildAppBar(context, isTheme),
      body: Container(
        constraints: const BoxConstraints.expand(),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              const SizedBox(height: kDefaultPadding / 3),
              const Stories(),
              const SizedBox(height: kDefaultPadding / 3),
              Column(children: image.map((e) => Posts(e, image: e)).toList())
            ],
          ),
        ),
      ),
    );
  }

  AppBar buildAppBar(BuildContext context, bool isTheme) => AppBar(
        toolbarHeight: 60,
        shape: Border(
          bottom: BorderSide(
            color: isTheme
                ? kContentColorLightTheme.withOpacity(0.1)
                : kContentColorDarkTheme.withOpacity(0.2),
            width: 0.5,
          ),
        ),
        title: appLogo(isTheme),
        actions: [
          appBarAddBtn(),
          appBarMsgBtn(),
          const SizedBox(width: kDefaultPadding / 2),
        ],
      );

  Widget appBarMsgBtn() => Container(
        margin: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
        child: IconBtn(
          darkIcon: 'assets/icons/dark-theme/msg.svg',
          lightIcon: 'assets/icons/light-theme/msg.svg',
          pressed: () {},
        ),
      );

  Widget appBarAddBtn() => Container(
        margin: const EdgeInsets.symmetric(vertical: kDefaultPadding / 2),
        child: IconBtn(
          darkIcon: 'assets/icons/dark-theme/add.svg',
          lightIcon: 'assets/icons/light-theme/add.svg',
          pressed: () {},
        ),
      );

  Widget appLogo(bool isTheme) => SizedBox(
        width: 150,
        height: 60,
        child: isTheme
            ? SvgPicture.asset('assets/logos/light-logo.svg', height: 40)
            : SvgPicture.asset('assets/logos/dark-logo.svg', height: 40),
      );
}
