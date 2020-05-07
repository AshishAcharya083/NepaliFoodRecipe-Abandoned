import 'package:flutter/material.dart';
import 'package:food/landing_page.dart';

void main() => runApp(MaterialApp(
 theme: ThemeData(
accentColor: Color(0xFFFFC529)
 ),
      home: MyApp(),
    ));

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LandingPage(),
    );
  }
}
