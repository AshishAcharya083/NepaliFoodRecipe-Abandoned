import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String networkImage;
  final String category;
  final String numberOfRecipe;

  CategoryCard({
    @required this.networkImage,
    @required this.category,
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
              child: 
Container(

                constraints: BoxConstraints(
                  minHeight: 20,
                  minWidth: 180,
                ),
                width: 150,
                // height: 120,
                // width: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),

                  image: DecorationImage(
                    fit: BoxFit.cover,
                      image: CachedNetworkImageProvider(
                        networkImage,
                      
                      )),
                ),
                
              ),
            ),
            Text(
              category,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            // Text(
            //   '$numberOfRecipe नुस्खा ',
            //   style: TextStyle(color: Colors.grey,fontSize: 10),
            // ),
          ],
        ));
  }
}

