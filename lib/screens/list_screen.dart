import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:food/constants.dart';
import 'package:food/components/searchbar.dart';
import 'package:food/models/recipe_list.dart';

class ListCard extends StatefulWidget {
  @override
  _ListCardState createState() => _ListCardState();
}

class _ListCardState extends State<ListCard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10, top: 15),
            child: SearchBar(),
          ),
          Expanded(child: RecipeListWheel()),
        ],
      ),
    );
  }
}

class RecipeListWheel extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
     
      itemExtent: 150,
      
        
          itemBuilder: (BuildContext context, int index) {
        // if (index < 0 || index > 10 || index > recipeList.length - 1) {
        //   return null;
        // }
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: (){print('hello!');},
                    child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Container(
                height: 240,
                color: Colors.transparent,
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.blueGrey,
                            image: DecorationImage(
                                image: CachedNetworkImageProvider(
                                    '${recipeList[index].image}'),
                                fit: BoxFit.cover),
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: recipeList[index].type == 'nveg'
                                    ? Colors.red.withOpacity(0.9)
                                    : Colors.green.withOpacity(0.9),
                                spreadRadius: 3,
                                blurRadius: 10,
                              )
                            ]),
                        
                      ),
                    ),
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
                            style: kNepaliTextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                          ),
                          Text('Veg'),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
            ),
          ),
        );
      },
      itemCount:recipeList.length ,
    );
  }
}

// GestureDetector(
//       behavior: HitTestBehavior.translucent,
//        onTap: (){

//                 Navigator.push(context, MaterialPageRoute(builder: (context) => CookingScreen()));
//               },
//               child: Container(
//             margin: EdgeInsets.symmetric(horizontal: 20),
//             height: 240,
//             child: Row(
//       children: <Widget>[
//         Expanded(
//           child: Stack(
//         children: <Widget>[
//               GestureDetector(
//                 onTap: (){
//                   Navigator.push(context, MaterialPageRoute(builder:
//                   (context) => CookingScreen()
//                   ));
//                 },
//                                   child: Container(
//       decoration: BoxDecoration(
//           image: DecorationImage(
//                   image: CachedNetworkImageProvider(
//                   '${recipeList[index].image}'),
//                   fit: BoxFit.cover),
//           color: Colors.blueGrey,
//           borderRadius: BorderRadius.circular(20),
//           boxShadow: [
//             BoxShadow(
//                   color: recipeList[index].type == 'nveg'
//                   ? Colors.red.withOpacity(0.9)
//                   : Colors.green.withOpacity(0.9),
//                   spreadRadius: 3,
//                   blurRadius: 10,
//             )
//           ]),
//                   ),
//               ),
//         ],
//         )),
//         Expanded(
//             child: Container(
//           decoration: BoxDecoration(
//                 color: Colors.white,
//                 boxShadow: kboxShadow,
//                 borderRadius: BorderRadius.only(
//           topRight: Radius.circular(20),
//           bottomRight: Radius.circular(20))),
//           height: 120,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: <Widget>[
//                 Text(
//       recipeList[index].name,
//       textAlign: TextAlign.center,
//       style: kNepaliTextStyle.copyWith(
//             fontWeight: FontWeight.bold),
//                   ),
//                 Text('Veg'),
//             ],
//           ),
//           ))
//       ],
//               ),
//           ),
//     );
