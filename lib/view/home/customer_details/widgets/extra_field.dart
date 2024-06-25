import 'package:flutter/material.dart';
import '../../../../utils/color.dart';

class TExtraField extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onPress;
  const TExtraField({
    super.key,
    required this.title,
    required this.icon,
    required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton.icon(
          style: ElevatedButton.styleFrom(
            fixedSize: Size(size.width * 0.42, size.height * 0.07),
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            backgroundColor: Colors.white,
            foregroundColor: greyColor,
          ),
          icon: Icon(
            icon,
            color: blackColor,
          ),
          onPressed: onPress,
          label: Text(title),
        ),
      ],
    );
  }
}
