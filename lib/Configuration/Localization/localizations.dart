import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyLocalizations {  
  MyLocalizations(this.locale);  
  
  final Locale locale;  
  
  static MyLocalizations of(BuildContext context) {  
    return Localizations.of<MyLocalizations>(context, MyLocalizations);  
  }  
  
  Map<String, String> _sentences;  
  
  Future<bool> load() async {
    String data = await rootBundle.loadString('lib/configuration/language/${this.locale.languageCode}.json');
    Map<String, dynamic> _result = json.decode(data);

    this._sentences = new Map();
    _result.forEach((String key, dynamic value) {
      this._sentences[key] = value.toString();
    });

    return true;
  }
  
  String trans(String key) {  
    return this._sentences[key];  
  }  
}