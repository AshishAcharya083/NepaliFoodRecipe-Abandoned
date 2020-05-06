import 'package:flutter/material.dart';
import 'package:food/landing_page.dart';

void main() => runApp(MaterialApp(
  
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
