import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Translate {
  Translate(this.locale);

  final Locale locale;

  static Translate of(BuildContext context) {
    return Localizations.of<Translate>(context, Translate);
  }

  Map<String, String> _sentences;

  Future<bool> load() async {
    String data = await rootBundle
        .loadString('lib/Template/Language/${this.locale.languageCode}.json');
    Map<String, dynamic> _result = json.decode(data);

    this._sentences = new Map();
    _result.forEach((String key, dynamic value) {
      this._sentences[key] = value.toString();
    });

    return true;
  }

  String key(String key) {
    return this._sentences[key];
  }
}
