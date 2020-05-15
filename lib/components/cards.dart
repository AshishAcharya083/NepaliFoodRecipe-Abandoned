import 'package:flutter/material.dart';



class CategoryCard extends StatelessWidget {
  final String networkImage;
  final String category;
  final String numberOfRecipe;
 
  CategoryCard(
      {@required this.networkImage,
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
              child: Container(
                constraints: BoxConstraints(
                  minHeight: 20,
                  
                  minWidth: 180,
                ),
                // height: 120,
                // width: 150,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    image: DecorationImage(
                        image: NetworkImage(networkImage), fit: BoxFit.cover)),
              ),
            ),
            Text(
              category,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 17,
              ),
            ),
            Text(
              '$numberOfRecipe नुस्खा ',
              style: TextStyle(color: Colors.grey),
            ),
          ],
        ));
  }
}
