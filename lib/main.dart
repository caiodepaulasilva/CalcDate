import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';
import 'package:calcdate/Template/Localization/Localizationsdelegate.dart';
import 'package:calcdate/Views/Home/Homepage.dart';
import 'package:calcdate/Business/CalculateBusiness.dart';
import 'package:calcdate/Business/menuBusiness.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<CalculateStore>.value(value: CalculateStore()),
          Provider<MenuStore>.value(value: MenuStore())
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          supportedLocales: [
            const Locale('pt', 'BR'),
            const Locale('en', 'US')
          ],
          localizationsDelegates: [
            const TranslateDelegate(),
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate
          ],
          localeResolutionCallback:
              (Locale locale, Iterable<Locale> supportedLocales) {
            for (Locale supportedLocale in supportedLocales) {
              if (supportedLocale.languageCode == locale.languageCode ||
                  supportedLocale.countryCode == locale.countryCode) {
                return supportedLocale;
              }
            }

            return supportedLocales.first;
          },
          title: 'CalcDate',
          home: HomePage(),
        ));
  }
}
