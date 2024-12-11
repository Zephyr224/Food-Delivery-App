import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SliderData extends ChangeNotifier {
  int activePage = 0;

  final PageController pageController = PageController(initialPage: 0);

  Timer? timer;

  void onPageChanged(int pageValue) { // needs to update specifically ui for slider
    activePage = pageValue;
    notifyListeners();
  }

  void startTimer() {
    timer = Timer.periodic(
      const Duration(seconds: 6),
      (timer) {
        if (pageController.page == 9) {
          pageController.animateToPage(0,
              duration: const Duration(seconds: 1),
              curve: Curves.elasticOut);
        } else {
          pageController.nextPage(
              duration: const Duration(seconds: 1),
              curve: Curves.easeInOut);
        }
      },
    );
  }
}