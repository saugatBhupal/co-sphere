import 'package:cosphere/src/core/constants/app_assets.dart';
import 'package:cosphere/src/core/constants/media_query_values.dart';
import 'package:flutter/material.dart';
import 'package:cosphere/src/core/constants/app_colors.dart';

class IntroSlider extends StatefulWidget {
  const IntroSlider({super.key});

  @override
  State<IntroSlider> createState() => _IntroSliderState();
}

class _IntroSliderState extends State<IntroSlider> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    final imageHeight =
        context.isTablet ? context.height * 0.6 : context.height / 1.9;
    return Column(
      children: [
        SizedBox(
          height: imageHeight,
          child: PageView(
            controller: _pageController,
            onPageChanged: (index) {
              setState(() {
                _currentPage = index;
              });
            },
            children: [
              buildPage(
                  AppImages.carousel2,
                  context.isTablet
                      ? context.height / 1.8
                      : context.height / 2.1),
              buildPage(AppImages.carousel1, context.height),
              buildPage(AppImages.carousel3, context.height),
              buildPage(
                  AppImages.carousel4,
                  context.isTablet
                      ? context.height / 1.8
                      : context.height / 2.1),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(4, (index) {
              return AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                margin: const EdgeInsets.symmetric(horizontal: 4.0),
                width: _currentPage == index ? 36.0 : 10.0,
                height: 10.0,
                decoration: BoxDecoration(
                  color: AppColors.midnight,
                  borderRadius: BorderRadius.circular(14.0),
                ),
              );
            }),
          ),
        ),
      ],
    );
  }

  Widget buildPage(String imagePath, double? size) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6),
      child: Center(
        child: Container(
          decoration: BoxDecoration(
            color: AppColors.satin,
            borderRadius: BorderRadius.circular(22),
          ),
          child: Image(
            width: size,
            height: size,
            fit: BoxFit.fitHeight,
            image: AssetImage(imagePath),
          ),
        ),
      ),
    );
  }
}
