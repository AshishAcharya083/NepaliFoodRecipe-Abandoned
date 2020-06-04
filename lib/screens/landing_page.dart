import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'homePage.dart';

import 'list_screen.dart';
// import 'cooking_screen.dart';


class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
   
  List tabs = [
 
    HomeScreen(),
    
    ListScreen(),
    // CookingScreen(),
    Text('this is n0. 3')
  ];

  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          height: 50,
          backgroundColor: Color(0xFFFFC529),
          items: <Widget>[
            Icon(
              Icons.home,
              size: 30,
            ),
            Icon(
              Icons.list,
              size: 30,
            ),
            Icon(
              Icons.person,
              size: 30,
            ),
          ],
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
        ),
        body: tabs[_currentIndex],
      ),
    );
  }
}
