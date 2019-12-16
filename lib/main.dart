import 'package:flutter/material.dart';
import 'package:dateCalculator/pages/homepage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:dateCalculator/localization/demolocalizationsdelegate.dart';

void main() => runApp(CalcDate());

class CalcDate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: [const Locale('pt', 'BR'), const Locale('en', 'US')],
      localizationsDelegates: [
        const DemoLocalizationsDelegate(),
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
      home: new HomePage(),
    );
  }
}
