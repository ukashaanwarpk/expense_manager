import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../../utils/color.dart';

class TImageTextAnimation extends StatelessWidget {
  const TImageTextAnimation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Column(
      children: [
        Image.asset(
          'assets/images/paper.png',
          height: size.height * 0.30,
          width: size.height * 0.30,
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Text(
          'To start recording transactions of this Customer, add their first transaction',
          textAlign: TextAlign.center,
          style: TextStyle(color: greyColor.shade500),
        ),
        SizedBox(
          height: size.height * 0.02,
        ),
        Lottie.asset(
          'assets/lottie/Animation - 1715261749308.json',
          height: size.height * 0.10,
        ),
      ],
    );
  }
}