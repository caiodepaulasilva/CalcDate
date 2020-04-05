import 'package:calcdate/pages/bloc/homepageBloc.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'Views/homepage.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:calcdate/configuration/localization/localizationsdelegate.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<MenuFeatures>(
            create: (context) {
              return MenuFeatures();
            },
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          supportedLocales: [
            const Locale('pt', 'BR'),
            const Locale('en', 'US')
          ],
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
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          home: HomePage(),
        ));
  }
}
