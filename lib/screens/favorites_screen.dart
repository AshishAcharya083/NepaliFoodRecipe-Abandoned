import 'package:flutter/material.dart';
import 'package:flutter_image/network.dart';
import 'package:food/models/recipe_list.dart';
import 'package:food/constants.dart';

class FavoriteScreen extends StatelessWidget {
  final List myIndexList;

  FavoriteScreen({this.myIndexList});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          itemCount: myIndexList.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                  width: MediaQuery.of(context).size.width * 0.8,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Column(
                      children: <Widget>[
                        Container(
                          constraints: BoxConstraints(
                              minHeight: 200,
                              minWidth: 200,
                              maxHeight: 300,
                              maxWidth: 300),
                          child: Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              height: 40,
                              decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.6),
                                  borderRadius: BorderRadius.only(
                                      bottomRight: Radius.circular(20),
                                      bottomLeft: Radius.circular(20))),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.max,
                                children: <Widget>[
                                  Flexible(
                                                                      child: Text(
                                                                      
                                        recipeList[myIndexList[index]].ename,
                                        style: kEnglishTextStyle,
                                        textAlign: TextAlign.center,
                                      ),
                                  )
                                ],
                              ),
                            ),
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImageWithRetry(
                                      recipeList[myIndexList[index]].image))),
                        ),
                      ],
                    ),
                  )),
            );
          }),
    )));
  }
}
