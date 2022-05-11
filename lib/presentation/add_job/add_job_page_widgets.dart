import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class IJSmoothPageIndicator extends SmoothPageIndicator {
  IJSmoothPageIndicator({required PageController pageController, Key? key})
      : super(
          key: key,
          controller: pageController,
          count: 6,
          effect: WormEffect(
            dotHeight: 7,
            dotWidth: 7,
            paintStyle: PaintingStyle.fill,
            dotColor: Colors.white.withOpacity(0.5),
            activeDotColor: Colors.white,
          ),
        );
}
