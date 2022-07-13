import 'package:flutter/material.dart';

import '../../../../constants.dart';
import '../../../../utils/unicorn_outline.dart';
import '../../components/behavior_widget.dart';

class Stories extends StatefulWidget {
  const Stories({Key? key}) : super(key: key);

  @override
  State<Stories> createState() => _StoriesState();
}

class _StoriesState extends State<Stories> {
  void onClickedStorie() {}

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      height: 100,
      width: size.width,
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding / 5),
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: 10,
          itemBuilder: ((context, index) => storyItem()),
        ),
      ),
    );
  }

  Widget storyItem() => Container(
        margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding / 4),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            storyImage(
                'https://images.viblo.asia/avatar-retina/464e689d-8f75-451f-a95c-b8b659ad88cc.jpeg'),
            authStory(),
          ],
        ),
      );

  Widget authStory() => SizedBox(
        width: 70,
        child: Text(
          'Thu Huyen vjdhsfvgjdhvg bdjfhvjhfdvjfdhg',
          style: AppStyle.kStorieTextStyle,
          maxLines: 1,
          textAlign: TextAlign.center,
        ),
      );

  Widget storyImage(String image) => SizedBox(
        width: 70,
        height: 70,
        child: UnicornOutline(
          radius: 100,
          strokeWidth: 2,
          gradient: const LinearGradient(
            colors: [Color(0xFFFBAA47), Color(0xFFD91A46), Color(0xFFA60F93)],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          child: Container(
            padding: const EdgeInsets.all(4),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: Image.network(image, fit: BoxFit.cover),
            ),
          ),
          onPressed: () => onClickedStorie(),
        ),
      );
}
