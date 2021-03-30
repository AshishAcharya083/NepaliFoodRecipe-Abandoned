import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image/network.dart';
import 'package:food/constants.dart';
import 'package:food/models/recipe_list.dart';
// import 'package:transparent_image/transparent_image.dart';
import '../models/networking.dart';
// import 'package:firebase_storage/firebase_storage.dart';

class CookingScreen extends StatefulWidget {
  final int indexOfFood;
  CookingScreen({@required this.indexOfFood});

  @override
  _CookingScreenState createState() => _CookingScreenState();
}

class _CookingScreenState extends State<CookingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            expandedHeight: 300.0,
            floating: false,
            pinned: true,
            flexibleSpace: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: FlexibleSpaceBar(
                  centerTitle: true,
                  titlePadding: EdgeInsets.only(top: 10),
                  title: Container(
                    height: 40,
                    decoration: BoxDecoration(
                        color: Colors.black.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(20)),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Text(
                          recipeList[widget.indexOfFood].name,
                          style: kNepaliTextStyle.copyWith(color: Colors.white),
                        )
                      ],
                    ),
                  ),
                  collapseMode: CollapseMode.parallax,
                  background: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          bottomRight: Radius.circular(30),
                          bottomLeft: Radius.circular(30)),
                      image: DecorationImage(
                          image: NetworkImageWithRetry(
                              recipeList[widget.indexOfFood].image),
                          fit: BoxFit.cover),
                    ),
                  )),
            ),
          ),
          SliverPadding(
            padding: EdgeInsets.symmetric(horizontal: 15),
            sliver: SliverList(
              delegate: SliverChildListDelegate(
                [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Text(
                      recipeList[widget.indexOfFood].ename,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 30,
                        wordSpacing: 1.5,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    child: Text(
                      recipeList[widget.indexOfFood].description ?? ' ',
                      textAlign: TextAlign.start,
                      style: kNepaliTextStyle.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                    color: kMainColor,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text('सामग्रीहरू',
                            style: kNepaliTextStyle.copyWith(fontSize: 25)),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          backgroundColor: Color(0xFFFFC529),
                          maxRadius: 13,
                          child: Text(
                            '${recipeList[widget.indexOfFood].ingredients.length}',
                            //Number of ingredients
                            style: TextStyle(fontSize: 15),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SliverGrid(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                childAspectRatio: 1.7),
            delegate: SliverChildBuilderDelegate(
                (BuildContext context, int index) {
              return SingleChildScrollView(
                physics: NeverScrollableScrollPhysics(),
                child: Column(
                  children: <Widget>[
                    Card(
                        elevation: 7,
                        shape:
                            CircleBorder(side: BorderSide(color: kMainColor)),
                        child: Center(
                            child: FutureBuilder<Widget>(
                                future: getImageUrl(
                                    recipeList[widget.indexOfFood]
                                        .ingredients
                                        .keys
                                        .elementAt(index)),
                                builder: (context, futureSnapshot) {
                                  if (!futureSnapshot.hasData) {
                                    return CupertinoActivityIndicator();
                                  }
                                  return futureSnapshot.data;
                                }))),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: FittedBox(
                        alignment: Alignment.center,
                        child: Container(
                            child: Text(
                          recipeList[widget.indexOfFood]
                              .ingredients
                              .values
                              .elementAt(index),
                          style: kNepaliTextStyle.copyWith(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )),
                      ),
                    )
                  ],
                ),
              );
            },
                childCount:
                    recipeList[widget.indexOfFood].ingredients.keys.length),
          ),
          SliverPadding(
              padding: EdgeInsets.only(
                top: 30,
                left: 15,
                right: 15,
              ),
              sliver: SliverToBoxAdapter(
                child: Text('पकाउने तरिका : ',
                    style: kNepaliTextStyle.copyWith(fontSize: 25)),
              )),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            sliver: SliverList(
                delegate: SliverChildListDelegate(List.generate(
                    recipeList[widget.indexOfFood].stepsForCooking.length,
                    (index) {
              return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Stack(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Card(
                          elevation: 3,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20)),
                          child: Container(
                            width: MediaQuery.of(context).size.width,
                            padding: EdgeInsets.only(
                                top: 30, left: 20, right: 20, bottom: 20),
                            decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(20)),
                              color: Color(0xFFf5f5f5),
                              // color: kMainColor.withOpacity(0.6)),
                            ),
                            child: Text(
                              recipeList[widget.indexOfFood]
                                  .stepsForCooking[index],
                              style: kNepaliTextStyle.copyWith(wordSpacing: 0),
                            ),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment(-0.8, -1),
                        child: CircleAvatar(
                          child: Text('${index + 1}'),
                          radius: 25,
                          backgroundColor: kMainColor,
                        ),
                      ),
                    ],
                  ));
            }))),
          )
        ],
      )),
    );
  }

  Future<Widget> getImageUrl(String imageName) async {
    NetworkHelper networkHelper = NetworkHelper(search: imageName);
    var decodedData = await networkHelper.getJsonData();

    return CircleAvatar(
        radius: 30,
        backgroundColor: Colors.transparent,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(50),
          child: CachedNetworkImage(
            imageUrl: decodedData,
            fadeInCurve: Curves.bounceInOut,
            height: 80,
            width: 80,
            fit: BoxFit.cover,
          ),
        ));
  }
}
