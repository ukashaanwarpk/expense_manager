
import 'package:expense_manager/utils/color.dart';
import 'package:expense_manager/view/onboarding/onboarding_screen.dart';
import 'package:expense_manager/view/splash/splash_screen.dart';
import 'package:expense_manager/view_model/i_gave/i_gave.dart';
import 'package:expense_manager/view_model/navigation/navigation_menu.dart';
import 'package:expense_manager/view_model/onboarding_view/onboarding_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'view_model/account/account_controller.dart';
import 'view_model/customer_details/customer_details.dart';
import 'view_model/customer_details/pick_contact.dart';
import 'view_model/language/language_controller.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final SharedPreferences sp = await SharedPreferences.getInstance();
  // First time shared Preference ma koi value ni ho gy that why we use ''
  final String language = sp.getString('language_code') ?? '';

  bool isFirstTime = sp.getBool('isFirstTime') ?? true;

  if (isFirstTime) {
    runApp(MyApp(
      isFirstTime: true,
      locale: language,
    ));
  } else {
    runApp(MyApp(
      isFirstTime: false,
      locale: language,
    ));
  }
}

class MyApp extends StatelessWidget {
  final bool isFirstTime;
  final String locale;
  const MyApp({super.key, required this.isFirstTime, required this.locale});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageController()),
        ChangeNotifierProvider(create: (_) => OnBoardingView()),
        ChangeNotifierProvider(create: (_) => NavigationController()),
        ChangeNotifierProvider(create: (_) => PickContactController()),
        ChangeNotifierProvider(create: (_) => IGave()),
        ChangeNotifierProvider(create: (_) => CustomerDetailsView()),
        ChangeNotifierProvider(create: (_) => AccountView()),
      ],
      child: Consumer<LanguageController>(
        builder: (context, provider, child) {
          if (provider.appLocal == null) {
            if (locale.isEmpty) {
              provider.changeLanguage(const Locale('en'));
            } else {
              provider.changeLanguage(Locale(locale));
            }
          }
          return GestureDetector(
            onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              // First time user aye ga to value store ni ho gy to by default english ho gy
              locale: locale == ''
                  ? const Locale('en')
                  : provider.appLocal ?? const Locale('en'),
              localizationsDelegates:  const [
                 AppLocalizations.delegate,
                 GlobalMaterialLocalizations.delegate,
                 GlobalWidgetsLocalizations.delegate,
                 GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale(
                  'en',
                ),
                Locale(
                  'ur',
                ),
                Locale('es')
              ],
              title: 'Expanse Manager',
              theme: ThemeData(
                scaffoldBackgroundColor: whiteColor,
                bottomSheetTheme: const BottomSheetThemeData(
                  surfaceTintColor: whiteColor,
                ),
                appBarTheme: const AppBarTheme(
                  surfaceTintColor: whiteColor,
                  color: whiteColor,
                ),
                textTheme: GoogleFonts.lexendTextTheme(),
              ),
              home:
                  isFirstTime ? const OnBoardingScreen() : const SplashScreen(),
            ),
          );
        },
      ),
    );
  }
}
