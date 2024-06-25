
import 'package:flutter/cupertino.dart';

import '../../view/account/account_screen.dart';
import '../../view/home/home_screen.dart';
import '../../view/wallet/wallet_screen.dart';

class NavigationController extends ChangeNotifier {
  int selectedIndex = 0;

  void changeIndex(int index) {
    selectedIndex = index;
    notifyListeners();
  }

  final screens = [
    const HomeScreen(),
    const WalletScreen(),
    const AccountScreen(),
  ];
}
