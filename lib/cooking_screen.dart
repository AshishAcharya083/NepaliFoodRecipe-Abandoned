import 'package:flutter/material.dart';

class CookingScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: CustomScrollView(
          
          physics: BouncingScrollPhysics(),
          slivers: <Widget>[
            SliverAppBar(
              
              backgroundColor: Colors.blue,
              elevation: 2,
              expandedHeight: 200.0,
              floating: true,
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
               
                
                  collapseMode: CollapseMode.parallax,
                  background: Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomRight: Radius.circular(30),
                            bottomLeft: Radius.circular(30)),
                        image: DecorationImage(
                            image: AssetImage('images/burger.jpg'),
                            fit: BoxFit.cover)),
                  )),
            ),
            SliverList(delegate: SliverChildListDelegate([
 Text(
                        'This is text',
                        style: TextStyle(fontSize: 50),
                      ),
                      Text('This is text', style: TextStyle(fontSize: 50)),
                      Text('This is text', style: TextStyle(fontSize: 50)),
                      Text('This is text', style: TextStyle(fontSize: 50)),
                      Text('This is text', style: TextStyle(fontSize: 50)),
                      Text('This is text', style: TextStyle(fontSize: 50)),
                      Text('This is text', style: TextStyle(fontSize: 50)),
                      Text('This is text', style: TextStyle(fontSize: 50)),
                      Text('This is text', style: TextStyle(fontSize: 50)),
                      Text('This is text', style: TextStyle(fontSize: 50)),
                      Text('This is text', style: TextStyle(fontSize: 50)),
                      Text('This is text', style: TextStyle(fontSize: 50)),
                      Text('This is text', style: TextStyle(fontSize: 50)),
                      Text('This is text', style: TextStyle(fontSize: 50)),
                      Text('This is text', style: TextStyle(fontSize: 50)),
                      Text('This is text', style: TextStyle(fontSize: 50))
            ]))
            
          ],
        ),
      ),
    );
  }
}
