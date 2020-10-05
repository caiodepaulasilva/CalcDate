import 'dart:async';  
import 'package:calcdate/Template/Localization/Localizations.dart';
import 'package:flutter/material.dart';

class TranslateDelegate extends LocalizationsDelegate<Translate> {  
  const TranslateDelegate();  
  
  @override  
  bool isSupported(Locale locale) => ['pt', 'en'].contains(locale.languageCode);  
  
  @override  
  Future<Translate> load(Locale locale) async {  
    Translate localizations = new Translate(locale);  
  await localizations.load();  
  
  return localizations;  
  }  
  
  @override  
  bool shouldReload(TranslateDelegate old) => false;  
}