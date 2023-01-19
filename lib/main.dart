import 'package:flutter/material.dart';

import './screens/geography_screen.dart';
import './screens/country_screen.dart';
import './screens/continents_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Know Geo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        canvasColor: Colors.white,
        fontFamily: 'Raleway',
      ),
      home: ContinentSreen(),
      routes: {
        CountryScreen.rountName: (ctx) => const CountryScreen(),
        GeographyScreen.rountName: (ctx) => const GeographyScreen(),
      },
    );
  }
}
