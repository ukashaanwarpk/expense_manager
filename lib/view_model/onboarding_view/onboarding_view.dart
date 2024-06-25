import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../view/splash/splash_screen.dart';

class OnBoardingView extends ChangeNotifier {
  int pageIndex = 0;

  final PageController pageController = PageController();
  void nextLine(int index) {
    pageIndex = index;
    notifyListeners();
  }

  void nextPage(BuildContext context) {
    if (pageIndex == 2) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => const SplashScreen()));
    } else {
      int page = pageIndex + 1;
      pageController.jumpToPage(page);
      notifyListeners();
    }
  }

  void onboardingCompleted() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isFirstTime', false);
  }
}
