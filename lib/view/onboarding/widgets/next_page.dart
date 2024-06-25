import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/color.dart';
import '../../../view_model/onboarding_view/onboarding_view.dart';

class NextPage extends StatelessWidget {
  const NextPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OnBoardingView>(context, listen: false);
    return GestureDetector(
      onTap: () {
        provider.nextPage(context);
        provider.onboardingCompleted();
      },
      child: Container(
        height: 50,
        width: 50,
        decoration: BoxDecoration(
          color: purpleColor.shade200,
          shape: BoxShape.circle,
        ),
        child: const Center(
          child: Icon(
            Icons.arrow_forward_ios,
            color: whiteColor,
          ),
        ),
      ),
    );
  }
}
