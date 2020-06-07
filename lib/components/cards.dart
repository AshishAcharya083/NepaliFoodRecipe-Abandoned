import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
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
                // height: 120,
                // width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20),topRight: Radius.circular(20)),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                        networkImage,
                      )),
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
