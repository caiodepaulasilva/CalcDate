import 'package:flutter/material.dart';
import 'package:dateCalculator/pages/homepage.dart';


void main() => runApp(CalcDate());

class CalcDate extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'dateCalculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      // List all of the app's supported locales here
      supportedLocales: [
        Locale('pt', 'BR'),
        Locale('en', 'US'),
        
      ],
      home: MyHomePage(),
    );
  }
}
