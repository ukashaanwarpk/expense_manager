

import 'package:flutter/material.dart';

import '../../../utils/color.dart';

class TImageAndText extends StatelessWidget {
  const TImageAndText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return GestureDetector(
      onTap: () {},
      child: Column(
        children: [
          Image.asset('assets/images/home.jpg', height:size.height*0.40 ,),
          Text(
            'Add a Customer and start recording their transaction',
            textAlign: TextAlign.center,
            style: TextStyle(color: greyColor.shade400),
          ),
        ],
      ),
    );
  }
}