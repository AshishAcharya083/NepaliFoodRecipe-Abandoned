import 'package:flutter/material.dart';
import 'package:food/screens/landing_page.dart';

void main() => runApp(MaterialApp(
      theme: ThemeData(
        accentColor: Color(0xFFFFC529),
        scaffoldBackgroundColor: Color(0xFFF5F5F5)
        
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
