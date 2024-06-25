import 'package:flutter/material.dart';
import '../../../utils/color.dart';
import 'account_menu.dart';

class TExpansionTile extends StatelessWidget {
  final String expansionTitle;
  final String title;
  final String subtitle;
  final IconData expansionLeading;
  final IconData leading;
  final IconData subLeading;
  final VoidCallback onPress;

  const TExpansionTile({
    super.key,
    required this.title,
    required this.leading,
    required this.expansionTitle,
    required this.subtitle,
    required this.expansionLeading,
    required this.subLeading, required this.onPress,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      iconColor: lightBlack,
      collapsedIconColor: lightBlack,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      leading: Icon(
        expansionLeading,
        color: lightBlack,
      ),
      title: Text(expansionTitle),
      children: [
        ListTile(
          onTap: onPress,
          tileColor: greyColor.shade100,
          leading: Icon(
            leading,
            color: lightBlack,
          ),
          title: Text(title),
        ),
        const TDivider(),
        ListTile(
          tileColor: greyColor.shade100,
          leading: Icon(
            subLeading,
            color: lightBlack,
          ),
          title: Text(subtitle),
        ),
      ],
    );
  }
}
