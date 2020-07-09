import 'package:flutter/material.dart';
import 'package:food/constants.dart';
import 'package:food/screens/landing_page.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MaterialApp(
    theme: ThemeData(
        // accentColor: Color(0xFFFFC529),
        scaffoldBackgroundColor: Color(0xFFF5F5F5)
        ),
    home: SplashScreen(
        seconds: 3,
        navigateAfterSeconds: LandingPage(),
        title: new Text(
          '\n\n\Food Health and Recipes in\n\n Nepali',
          textAlign: TextAlign.center,
          style: TextStyle(
              fontSize: 20,
              shadows: [
                Shadow(
                  blurRadius: 5.0,
                  color: Colors.green,
                  offset: Offset(2.0, 2.0),
                ),
              ],
              letterSpacing: 2,
              wordSpacing: 2,
              fontWeight: FontWeight.bold),
        ),
        image: new Image.asset('images/icon.png'),
        photoSize: 100,
        loadingText: Text(
          'Loading....',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        gradientBackground: LinearGradient(
          colors: [
            Colors.yellow.shade400,
            Colors.orange.shade400,
            kMainColor,
            Colors.pink[200]
          ],
          begin: Alignment.bottomLeft,
          end: Alignment.topRight,
        ),
        backgroundColor: Colors.white,
        styleTextUnderTheLoader: TextStyle(),
        loaderColor: Colors.transparent)));
