
import 'package:flutter/material.dart';
import 'package:food/constants.dart';
import 'package:food/models/recipe_list.dart';
import 'package:flutter_image/network.dart';
import 'package:food/screens/cooking_screen.dart';


class NewestScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(
                "Newest Items",
                style: kEnglishTextStyle.copyWith(fontSize: 30),
              ),
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
            body: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  itemCount: 15,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context) => CookingScreen(indexOfFood: recipeList.length - index - 1)));
                      },
                                          child: Padding(
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
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          mainAxisSize: MainAxisSize.max,
                                          children: <Widget>[
                                            Flexible(
                                              child: Text(
                                                recipeList[recipeList.length - index - 1].ename,
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
                                                recipeList[recipeList.length - index - 1].image))),
                                  ),
                                ],
                              ),
                            )),
                      ),
                    );
                  }),
            )));
  }
}