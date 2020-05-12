import 'package:flutter/material.dart';

class CookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverAppBar(
                   
                    
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    expandedHeight: 200.0,
                    floating: false,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                     
                     collapseMode: CollapseMode.parallax,
                      background: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(bottomRight: Radius.circular(30),bottomLeft: Radius.circular(30)),
                          image: DecorationImage(image: AssetImage('images/burger.jpg'),
                          fit: BoxFit.cover
                          )
                        ),
                       
                      )
                    ),
                  ),
                  SliverFillRemaining(
                    child: Center(
                      child: Text('This is the center of the widget'),
                    ),
                  )
                ],
        ),
        
      ),
      
    );
  }
}