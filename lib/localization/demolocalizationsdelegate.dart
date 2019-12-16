import 'dart:async';  
import 'package:flutter/material.dart';
import 'package:dateCalculator/localization/demolocalizations.dart';

class DemoLocalizationsDelegate extends LocalizationsDelegate<DemoLocalizations> {  
  const DemoLocalizationsDelegate();  
  
  @override  
  bool isSupported(Locale locale) => ['pt', 'en'].contains(locale.languageCode);  
  
  @override  
  Future<DemoLocalizations> load(Locale locale) async {  
    DemoLocalizations localizations = new DemoLocalizations(locale);  
  await localizations.load();  
  
  print("Load ${locale.languageCode}");  
  
  return localizations;  
  }  
  
  @override  
  bool shouldReload(DemoLocalizationsDelegate old) => false;  
}