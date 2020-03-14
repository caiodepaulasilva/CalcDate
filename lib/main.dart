import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:CalcDate/views/pages/homepage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:CalcDate/configuration/localization/localizationsdelegate.dart';

void main() => runApp(CalcDate());

class CalcDate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      supportedLocales: [const Locale('pt', 'BR'), const Locale('en', 'US')],
      localizationsDelegates: [
        const MyLocalizationsDelegate(),
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
      home: BlocProvider(
        child: new HomePage(),
      ),
    );
  }
}
