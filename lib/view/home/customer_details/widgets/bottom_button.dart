import 'package:flutter/material.dart';
import '../../../../utils/color.dart';

class BottomButton extends StatelessWidget {
  final Color background;
  final String text;
  final VoidCallback onPress;

  final IconData iconData;
  const BottomButton({
    super.key,
    required this.background,
    required this.text,
    required this.iconData,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return SizedBox(
      width: size.width * 0.44,
      child: ElevatedButton.icon(
          icon: Icon(
            iconData,
            color: whiteColor,
          ),
          style: ElevatedButton.styleFrom(
            backgroundColor: background,
            foregroundColor: whiteColor,
          ),
          onPressed: onPress,
          label: Text(text)),
    );
  }
}
