import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LanguageController extends ChangeNotifier {
  Locale? _appLocale;
  Locale? get appLocal => _appLocale;

  void changeLanguage(Locale locale) async {
    final SharedPreferences sp = await SharedPreferences.getInstance();
    _appLocale=locale;

    if (locale == const Locale('en')) {
      await sp.setString('language_code', 'en');
    }
    else if(locale == const Locale('ur')){
      await sp.setString('language_code', 'ur');
    }
    else {
     await sp.setString('language_code', 'es');

    }
    notifyListeners();
  }
}



