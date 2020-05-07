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
      padding: const EdgeInsets.symmetric(horizontal: 0,vertical: 20),
      child: Column(
        
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SearchBar(),
          Expanded(
              child: ListWheelScrollView.useDelegate(
            diameterRatio: 1.2,
            perspective: 0.0000000001,
            itemExtent: 150,
            childDelegate: ListWheelChildBuilderDelegate(
                builder: (BuildContext context, int index) {
              if (index < 0 || index > 10) {
                return null;
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Stack(
                  
                  children: [
                  // Container(
                  //   height: 275.0,
                  //   width: 200.0,
                  //   color: Colors.transparent,
                  // ),
                  Positioned(
                      top: 20.0,
                      child: Container(
                          height: 100.0,
                          width: MediaQuery.of(context).size.width *0.7,
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
                  Positioned(
                      left: 200.0,
                      bottom: 50,
                      child: Container(
                        // height: 110.0,
                        // width: 110.0,
                        constraints: BoxConstraints(
                          maxHeight:100.0,
                          maxWidth: 100.0 
                        ),
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                                image: AssetImage('images/burger.jpg'),
                                fit: BoxFit.cover)),
                      ))
                ]),
              );
            }),
          )),
        ],
      ),
    );
  }
}
