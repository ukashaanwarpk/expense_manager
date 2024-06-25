
import 'package:expense_manager/utils/extension.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'account_menu.dart';
import 'bottom_sheet.dart';
import 'expansion_tile.dart';

class TAccountMenuTile extends StatelessWidget {
  const TAccountMenuTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TExpansionTile(
          expansionTitle: 'Business Details',
          expansionLeading: Icons.add_business,
          title: 'Business Name',
          leading: CupertinoIcons.info,
          subtitle: 'Business Type',
          subLeading: Icons.business_sharp,
          onPress: () {},
        ),
        const TDivider(),
        TExpansionTile(
          expansionTitle: 'Account Settings',
          expansionLeading: Icons.settings,
          title: 'App Language',
          leading: Icons.language,
          subtitle: 'Privacy Policy',
          subLeading: Icons.privacy_tip,
          onPress: () {
            Sheets.bottomSheet(context);
          },
        ),
        const TDivider(),
        const TAccountMenu(title: 'Deleted Items', icon: Icons.delete),
        const TDivider(),
         TAccountMenu(title: context.loc!.share, icon: Icons.share),
        const TDivider(),
        const TAccountMenu(title: 'Logout', icon: Icons.logout),
      ],
    );
  }
}
