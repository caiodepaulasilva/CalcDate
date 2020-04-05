import 'dart:async';  
import 'package:flutter/material.dart';
import 'package:calcdate/configuration/localization/localizations.dart';

class MyLocalizationsDelegate extends LocalizationsDelegate<MyLocalizations> {  
  const MyLocalizationsDelegate();  
  
  @override  
  bool isSupported(Locale locale) => ['pt', 'en'].contains(locale.languageCode);  
  
  @override  
  Future<MyLocalizations> load(Locale locale) async {  
    MyLocalizations localizations = new MyLocalizations(locale);  
  await localizations.load();  
  
  return localizations;  
  }  
  
  @override  
  bool shouldReload(MyLocalizationsDelegate old) => false;  
}