import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants.dart';
import 'components/icons/bottombar_custom_icon.dart';

class OverView extends StatefulWidget {
  const OverView({super.key});

  @override
  State<OverView> createState() => _OverViewState();
}

class _OverViewState extends State<OverView> {
  int pageIndex = 2;

  @override
  Widget build(BuildContext context) {
    bool isTheme =
        MediaQuery.of(context).platformBrightness == Brightness.light;
    return Scaffold(
      body: listScreens[pageIndex],
      bottomNavigationBar: Container(
        width: double.infinity,
        height: 65,
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
        child: bottomNavBar(isTheme),
      ),
    );
  }

  Widget bottomNavBar(bool isTheme) => BottomNavigationBar(
        onTap: (index) => setState(() {
          pageIndex = index;
        }),
        currentIndex: pageIndex,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        selectedItemColor: Colors.transparent,
        elevation: 0,
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              isTheme
                  ? 'assets/icons/light-theme/reels.svg'
                  : 'assets/icons/dark-theme/reels.svg',
              height: pageIndex == 0 ? kIconActiveSize : kIconSize,
              width: pageIndex == 0 ? kIconActiveSize : kIconSize,
            ),
            label: 'Reels',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              isTheme
                  ? 'assets/icons/light-theme/search.svg'
                  : 'assets/icons/dark-theme/search.svg',
              height: pageIndex == 1 ? kIconActiveSize : kIconSize,
              width: pageIndex == 1 ? kIconActiveSize : kIconSize,
            ),
            label: 'Search',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              isTheme
                  ? 'assets/icons/light-theme/home.svg'
                  : 'assets/icons/dark-theme/home.svg',
              height: pageIndex == 2 ? kIconActiveSize : kIconSize,
              width: pageIndex == 2 ? kIconActiveSize : kIconSize,
            ),
            label: 'Home',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              isTheme
                  ? 'assets/icons/light-theme/heart.svg'
                  : 'assets/icons/dark-theme/heart.svg',
              height: pageIndex == 3 ? kIconActiveSize : kIconSize,
              width: pageIndex == 3 ? kIconActiveSize : kIconSize,
            ),
            label: 'Heart',
            tooltip: '',
          ),
          BottomNavigationBarItem(
            icon: BottomBarCustomIcon(
              size: pageIndex == 4 ? kIconActiveSize + 3.5 : kIconSize + 5,
              image: 'anh-gai-xinh-toc-dai-deo-kinh-2k4.jpg',
              pressed: () => setState(() {
                pageIndex = 4;
              }),
            ),
            label: 'Person',
            tooltip: '',
          ),
        ],
      );
}
