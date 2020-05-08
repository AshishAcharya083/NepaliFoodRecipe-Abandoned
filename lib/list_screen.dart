import 'package:flutter/material.dart';
import 'searchbar.dart';

class ListCard extends StatefulWidget {
  @override
  _ListCardState createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 20),
      child: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SearchBar(),
          Expanded(
              child: ListWheelScrollView.useDelegate(
            diameterRatio: 1.2,
            perspective: 0.0001,
           
            itemExtent: 150,
            childDelegate: ListWheelChildBuilderDelegate(
                builder: (BuildContext context, int index) {
              if (index < 0 || index > 10) {
                return null;
              }
              return Stack(
                alignment: Alignment.center,
                
                children: [
                // Container(
                //   height: 275.0,
                //   width: 200.0,
                //   color: Colors.transparent,
                // ),
                Align(
                  alignment: Alignment.center,
                    // top: 20.0,
                    child: Container(
                        height: 120.0,
                        width: MediaQuery.of(context).size.width ,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.lightGreen,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[],
                        ),
                      )),
                Align(
                  
                  alignment: Alignment(0.8, -1),
                    // left: 200.0,
                    // bottom: 50,
                    child: Container(
                      
                      // height: 110.0,
                      // width: 110.0,
                      constraints: BoxConstraints(
                        maxHeight:110.0,
                        maxWidth: 110.0 
                      ),
                      decoration: BoxDecoration(
                        boxShadow: [
      BoxShadow(
        color: Colors.green.withOpacity(0.9),
        spreadRadius: 3,
        blurRadius: 10,
         // changes position of shadow
      ),
    ],
                       border: Border.all(
                         width: 3,
                         color: Colors.green
                       ),
                          shape: BoxShape.circle,
                          image: DecorationImage(
                              image: AssetImage('images/burger.jpg'),
                              fit: BoxFit.cover)),
                    ))
              ]);
            }),
          )),
        ],
      ),
    );
  }
}
