import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../utils/color.dart';
import '../../../view_model/language/language_controller.dart';

class Sheets {
  static void bottomSheet(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20),)),
        context: context,
        builder: (context) {
          return SizedBox(
            height: size.height * 0.35,
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 4,
                  margin: EdgeInsets.symmetric(
                      vertical: size.height * 0.02,
                      horizontal: size.width * 0.30),
                  decoration: BoxDecoration(
                      color: greyColor.shade400,
                      borderRadius: BorderRadius.circular(12)),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                  child: Text(
                    'Select the app Language',
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Consumer<LanguageController>(
                  builder: (BuildContext context, LanguageController value, Widget? child) {
                    return Column(
                      children: [
                        ListTile(
                          onTap: (){
                            value.changeLanguage(const Locale('en'));
                            Navigator.pop(context);

                          },
                          title: const Text('English'),
                          trailing: value.appLocal == const Locale('en') ? const Icon(Icons.check, color: lightBlack) : null,
                          tileColor: value.appLocal == const Locale('en')? greyColor.shade100 : null,

                        ),
                        ListTile(
                          onTap: (){
                            value.changeLanguage(const Locale('ur'));
                            Navigator.pop(context);
                          },

                          title: const Text('Urdu'),
                          trailing: value.appLocal == const Locale('ur') ? const Icon(Icons.check, color: lightBlack) : null,
                          tileColor: value.appLocal == const Locale('ur')? greyColor.shade100 : null,

                        ),
                        ListTile(
                          onTap: (){
                            value.changeLanguage(const Locale('es'));
                            Navigator.pop(context);
                          },

                          title: const Text('Espanola'),
                          trailing: value.appLocal == const Locale('es')? const Icon(Icons.check, color:lightBlack) : null,
                          tileColor: value.appLocal == const Locale('es')? greyColor.shade100 : null,

                        ),
                      ],
                    );
                  },
                ),
              ],
            ),
          );
        });
  }
}

