import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../utils/images/images.dart';
import '../../view_model/onboarding_view/onboarding_view.dart';
import 'widgets/next_page.dart';
import 'widgets/onboarding_lines.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OnBoardingView>(context, listen: false);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              child: PageView.builder(
                  itemCount: AppImages.onboardingImages.length,
                  onPageChanged: provider.nextLine,
                  controller: provider.pageController,
                  itemBuilder: (context, index) {
                    return Image.asset(AppImages.onboardingImages[index]);
                  }),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: List.generate(
                      AppImages.onboardingImages.length,
                      (index) => OnBoardingLines(
                        index: index,
                      ),
                    ),
                  ),
                  const NextPage(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
