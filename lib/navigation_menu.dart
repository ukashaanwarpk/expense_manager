import 'package:expense_manager/utils/color.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view_model/navigation/navigation_menu.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<NavigationController>(context);
    return Scaffold(
      bottomNavigationBar: NavigationBar(
        height: 80,
        elevation: 0.50,
        backgroundColor: whiteColor,
        indicatorColor: greyColor.shade200,
        selectedIndex: provider.selectedIndex,
        onDestinationSelected: (index) => provider.changeIndex(index),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.add), label: 'Khata'),
          NavigationDestination(icon: Icon(Icons.wallet), label: 'Wallet'),
          NavigationDestination(icon: Icon(Icons.person), label: 'Account'),
        ],
      ),
      body: IndexedStack(
        index: provider.selectedIndex,
        children: provider.screens,
      ),
    );
  }
}
