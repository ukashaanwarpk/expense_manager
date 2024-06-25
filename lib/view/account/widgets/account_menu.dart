import 'package:flutter/material.dart';
import '../../../utils/color.dart';

class TAccountMenu extends StatelessWidget {
  final String title;
  final IconData icon;
  const TAccountMenu({super.key, required this.title, required this.icon});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(title),
      leading: Icon(icon, color: lightBlack,),
    );
  }
}


class TDivider extends StatelessWidget {
  const TDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      color: greyColor.shade100,
    );
  }
}
