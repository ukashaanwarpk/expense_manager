import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../utils/color.dart';
import '../../../view_model/onboarding_view/onboarding_view.dart';

class OnBoardingLines extends StatelessWidget {
  final int index;
  const OnBoardingLines({super.key, required this.index});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<OnBoardingView>(
      context,
    );
    return Container(
      margin: const EdgeInsets.all(5),
      height: 5,
      width: 30,
      decoration: BoxDecoration(
        color: provider.pageIndex == index ? purpleColor.shade200 : greyColor,
      ),
    );
  }
}
