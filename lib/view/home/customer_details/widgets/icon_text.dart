import 'package:flutter/material.dart';

import '../../../../utils/color.dart';

class TIconText extends StatelessWidget {
  final String title;
  final IconData icon;
  final Color color;
  const TIconText({
    super.key, required this.title, required this.icon, required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return  Column(
      children: [
        Icon(icon, color: color,),
        const SizedBox(height: 3,),
        Text(title, style: TextStyle(color: greyColor.shade400),)

      ],
    );
  }
}