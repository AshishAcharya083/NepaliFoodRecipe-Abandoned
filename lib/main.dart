import 'package:flutter/material.dart';
import 'package:food/models/favorites_list.dart';
import 'package:food/screens/landing_page.dart';
import 'package:provider/provider.dart';
import 'package:splashscreen/splashscreen.dart';

void main() => runApp(MaterialApp(
    theme: ThemeData(
        accentColor: Color(0xFFFFC529),
        scaffoldBackgroundColor: Color(0xFFF5F5F5)),
    home: SplashScreen(
        
    seconds: 10,
    navigateAfterSeconds: LandingPage(),
    title: new Text(
      '\n\n\Food Health and Recipes in\n\n Nepali',
      textAlign: TextAlign.center,
      style: TextStyle(
          fontSize: 20,
          shadows: [
            Shadow(
              blurRadius: 5.0,
              color: Colors.yellow.withOpacity(0.7),
              offset: Offset(2.0, 2.0),
            ),
          ],
          letterSpacing: 2,
          wordSpacing: 2,
          fontWeight: FontWeight.bold),
    ),
    // image: new Image.asset('images/splash_loading.gif'), //LOGO OF APP
    backgroundColor: Colors.white,
    imageBackground: AssetImage('images/splash_egg.jpg'),
    styleTextUnderTheLoader: TextStyle(),
    loaderColor: Colors.yellow)));
