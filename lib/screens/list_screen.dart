import 'package:flutter/material.dart';
import 'package:food/constants.dart';
import 'package:food/components/searchbar.dart';
import 'package:food/models/recipe_list.dart';
import 'package:food/screens/cooking_screen.dart';
class ListCard extends StatefulWidget {
  @override
  _ListCardState createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SearchBar(),
          Expanded(
              child: RecipeListWheel()),
        ],
      ),
    );
  }
}



class RecipeListWheel extends StatelessWidget {
 

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context) => CookingScreen()));},
          child: ListWheelScrollView.useDelegate(
        
              diameterRatio: 1.2,
              perspective: 0.0001,
              itemExtent: 150,
              childDelegate: ListWheelChildBuilderDelegate(
        builder: (BuildContext context, int index) {
          
      if (index < 0 || index > 10 || index > recipeList.length - 1) {
        return null;
      }
      return Container(
        margin: EdgeInsets.symmetric(horizontal: 20),
        height: 240,
        child: Row(
          children: <Widget>[
            Expanded(
                child: Stack(
              children: <Widget>[
                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage('${recipeList[index].image}' ) ,
                          fit: BoxFit.cover),
                      color: Colors.blueGrey,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [
                        BoxShadow(
                          color: recipeList[index].type =='nveg'?  Colors.red.withOpacity(0.9) : Colors.green.withOpacity(0.9),
                          spreadRadius: 3,
                          blurRadius: 10,
                        )
                      ]),
                ),
              ],
            )),
            Expanded(
                child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: kboxShadow,
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              height: 120,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    recipeList[index].name,
                    textAlign: TextAlign.center,
                    style: kNepaliTextStyle.copyWith(fontWeight: FontWeight.bold),
                  ),
                  Text('Veg'),
                ],
              ),
            ))
          ],
        ),
      );
              }),
            ),
    );
  }
}

// Stack(
//                 alignment: Alignment.center,

//                 children: [
//                 // Container(
//                 //   height: 275.0,
//                 //   width: 200.0,
//                 //   color: Colors.transparent,
//                 // ),
//                 Align(
//                   alignment: Alignment.center,
//                     // top: 20.0,
//                     child: Container(
//                         height: 120.0,
//                         width: MediaQuery.of(context).size.width ,
//                         decoration: BoxDecoration(
//                           borderRadius: BorderRadius.circular(20.0),
//                           color: Colors.lightGreen,
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.end,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: <Widget>[],
//                         ),
//                       )),
//                 Align(

//                   alignment: Alignment(0.8, -1),
//                     // left: 200.0,
//                     // bottom: 50,
//                     child: Container(

//                       // height: 110.0,
//                       // width: 110.0,
//                       constraints: const BoxConstraints(
//                         maxHeight:110.0,
//                         maxWidth: 110.0
//                       ),
//                       decoration:  BoxDecoration(
//                         boxShadow: [
//       BoxShadow(
//         color: Colors.green.withOpacity(0.9),
//         spreadRadius: 3,
//         blurRadius: 10,
//          // changes position of shadow
//       ),
//     ],
//                        border: Border.all(
//                          width: 3,
//                          color: Colors.green
//                        ),
//                           shape: BoxShape.circle,
//                           image: DecorationImage(
//                               image: AssetImage('images/burger.jpg'),
//                               fit: BoxFit.cover)),
//                     ))
//               ]);
