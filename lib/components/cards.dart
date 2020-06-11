import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image/network.dart';
import 'package:food/constants.dart';

class CategoryCard extends StatelessWidget {
  final String networkImage;
  final String foodName;
  final String numberOfRecipe;

  CategoryCard({
    @required this.networkImage,
    @required this.foodName,
    this.numberOfRecipe,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        elevation: 5,
        // color: Color(0xFFFFC529),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 5,
              child: Container(
                constraints: BoxConstraints(
                  minHeight: 20,
                  minWidth: 180,
                ),
                width: 150,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(topLeft:Radius.circular(15),topRight: Radius.circular(15)),
                  child: FadeInImage(
                    
                    fadeInCurve: Curves.fastLinearToSlowEaseIn,
                    fadeInDuration: Duration(milliseconds: 200),
                    fit: BoxFit.cover,
                    placeholder: AssetImage('images/burger.jpg'), image: NetworkImageWithRetry(networkImage)),
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                  
                ),
              ),
            ),
            Expanded(
              
              child: Center(
                
                child: Text(foodName,
                textAlign: TextAlign.center,
                    style: kNepaliTextStyle.copyWith(fontSize: 15)),
              ),
            ),
           
          ],
        ));
  }
}
