import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../../../../../constants.dart';
import '../../../../components/icons/icon_btn.dart';
import '../../comments/comments.dart';

class PostBody extends StatefulWidget {
  const PostBody(
      {super.key,
      required this.images,
      required this.avatar,
      required this.username,
      required this.caption,
      required this.postingTime});

  final List images;
  final String avatar;
  final String username;
  final String caption;
  final String postingTime;

  @override
  State<PostBody> createState() => _PostBodyState();
}

class _PostBodyState extends State<PostBody> {
  int activateIndex = 0;
  double imageIndexOpacity = 0.0;

  void onPageChanged(int index) {
    setState(() {
      activateIndex = index;
      imageIndexOpacity = 1.0;
    });

    Timer(const Duration(seconds: 5),
        () => setState(() => imageIndexOpacity = 0.0));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        Column(
          children: [
            SizedBox(
                width: size.width,
                height: size.width * 1.2,
                child: _carouselSlider(size)),
            Container(
              height: 50,
              width: size.width,
              padding: const EdgeInsets.all(kDefaultPadding / 4),
              child: Stack(
                children: [
                  Center(child: _buildIndicator()),
                  Positioned(
                    top: 0,
                    left: 0,
                    child: Row(
                      children: [_heartBtn(), _commentBtn(), _shareBtn()],
                    ),
                  ),
                  Positioned(top: 0, right: 0, child: _bookMarkBtn())
                ],
              ),
            )
          ],
        ),
        Positioned(
          top: kDefaultPadding / 2,
          right: kDefaultPadding / 2,
          child: AnimatedOpacity(
            opacity: imageIndexOpacity,
            duration: const Duration(milliseconds: 500),
            child: _imageIndex(),
          ),
        )
      ],
    );
  }

  Widget _buildIndicator() => AnimatedSmoothIndicator(
        count: widget.images.length,
        activeIndex: activateIndex,
        effect: const ScrollingDotsEffect(
          activeStrokeWidth: 2.6,
          activeDotScale: 1.4,
          maxVisibleDots: 5,
          radius: 8,
          spacing: 6,
          dotWidth: 6,
          dotHeight: 6,
          activeDotColor: kPrimaryColor,
        ),
      );

  Widget _imageIndex() => Container(
        width: 36,
        height: 24,
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.4),
          borderRadius: BorderRadius.circular(kDefaultBorderRadius * 1.2),
        ),
        child: Center(
          child: Text(
            '${activateIndex + 1}/${widget.images.length}',
            style: GoogleFonts.mulish(
              fontSize: 13,
              color: Colors.white,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
      );

  Widget _carouselSlider(Size size) => CarouselSlider.builder(
        itemCount: widget.images.length,
        options: CarouselOptions(
          height: size.width * 1.2,
          autoPlay: false,
          viewportFraction: 1,
          scrollPhysics: widget.images.length <= 1
              ? const NeverScrollableScrollPhysics()
              : const BouncingScrollPhysics(),
          enlargeStrategy: CenterPageEnlargeStrategy.height,
          onPageChanged: (index, reason) => onPageChanged(index),
        ),
        itemBuilder: (context, index, realIndex) {
          return CachedNetworkImage(
            imageUrl: widget.images[index],
            fit: BoxFit.cover,
            progressIndicatorBuilder: (context, url, progress) => Center(
              child: CircularProgressIndicator(
                value: progress.progress,
              ),
            ),
            errorWidget: (context, url, error) => const Icon(Icons.error),
          );
        },
      );

  Widget _bookMarkBtn() => IconBtn(
        darkIcon: 'assets/icons/dark-theme/book-mark.svg',
        lightIcon: 'assets/icons/light-theme/book-mark.svg',
        pressed: () {},
      );

  Widget _shareBtn() => IconBtn(
        darkIcon: 'assets/icons/dark-theme/share.svg',
        lightIcon: 'assets/icons/light-theme/share.svg',
        pressed: () {},
      );

  Widget _commentBtn() => IconBtn(
        darkIcon: 'assets/icons/dark-theme/cmt.svg',
        lightIcon: 'assets/icons/light-theme/cmt.svg',
        pressed: () => Navigator.push(
            context,
            CupertinoPageRoute(
              builder: (BuildContext context) => CommentScreen(
                postId: '1',
                avatar: widget.avatar,
                username: widget.username,
                caption: widget.caption,
                postingTime: widget.postingTime,
              ),
            )),
      );

  Widget _heartBtn() => IconBtn(
        darkIcon: 'assets/icons/dark-theme/heart.svg',
        lightIcon: 'assets/icons/light-theme/heart.svg',
        pressed: () {},
      );
}
