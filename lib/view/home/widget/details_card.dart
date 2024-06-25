import 'package:flutter/material.dart';
import '../../../utils/color.dart';

class TDetailsCard extends StatelessWidget {
  final String text;
  final Color cardColor;
  final Color circleColor;
  final Color textColor;
  final Color subTextColor;
  const TDetailsCard({
    super.key,
    required this.cardColor,
    required this.textColor,
    required this.subTextColor,
    required this.text,
    required this.circleColor,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
        height: size.height * 0.10,
        width: size.width * 0.44,
        decoration: BoxDecoration(
            color: cardColor, borderRadius: BorderRadius.circular(10)),
        child: ListTile(
          contentPadding: const EdgeInsets.symmetric(horizontal: 8),
          leading: Container(
            padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
            decoration: BoxDecoration(
              color: circleColor,
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.arrow_downward,
              color: whiteColor,
            ),
          ),
          title: Text(
            'Rs.0',
            style: TextStyle(color: textColor, fontWeight: FontWeight.w600),
          ),
          subtitle: Text(
            text,
            style: TextStyle(color: subTextColor, fontSize: 12),
          ),
        ));
  }
}
