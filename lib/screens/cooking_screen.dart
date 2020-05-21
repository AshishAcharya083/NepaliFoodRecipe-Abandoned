import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:food/constants.dart';
import 'package:food/models/recipe_list.dart';
import 'package:http/http.dart' as http;

class CookingScreen extends StatefulWidget {
  @override
  _CookingScreenState createState() => _CookingScreenState();
}

class _CookingScreenState extends State<CookingScreen> {
  String imageLink;

   getJsonData(String name) async {
    http.Response response = await http.get(
        'https://api.unsplash.com/search/photos?per_page=1&client_id=pnddBzwFT4wI7MvYeIWucAV-i_cQ0GZ141lte8niAdY&query=${name}');
    
    var convertDatatoJson = jsonDecode(response.body);
    

   setState(() {
     imageLink = convertDatatoJson['results'][0]['urls']['small'];
   });
    return imageLink;
  }

  @override
  void initState() {
    
    super.initState();
    // this.getJsonData();
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomPadding: true,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: <Widget>[
          SliverAppBar(
            backgroundColor: Colors.white,
            elevation: 0,
            expandedHeight: 200.0,
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
                          recipeList[0].name,
                          style: kNepaliTextStyle,
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
                            image: AssetImage('images/burger.jpg'),
                            fit: BoxFit.cover)),
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
                      recipeList[0].ename,
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
                      'लोकप्रिय विश्वासको विपरीत, लोरेम इप्सम केवल अनियमित पाठ मात्र होइन। यसको पुरानो शास्त्रीय ल्याटिन साहित्यको एउटा टुक्रामा BC 45 ईसापूर्व। From देखि शुरू भएको छ, जुन २००० वर्ष भन्दा पुरानो भयो। भर्जिनियाको ह्याम्पडेन-सिड्नी कलेजका ल्याटिन प्रोफेसर रिचर्ड म्याक्लिन्टोकले लोरेम इप्सम खण्डबाट ल्याटिन शब्दहरू अस्पष्ट पार्न खोज्नुभयो र शास्त्रीय साहित्यमा उक्त शब्दको उद्धरण गर्दै निस्सन्देह स्रोत पत्ता लगाए।',
                      textAlign: TextAlign.start,
                      style: kNepaliTextStyle.copyWith(
                          fontWeight: FontWeight.bold, color: Colors.grey),
                    ),
                  ),
                  Divider(
                    thickness: 2,
                    indent: 20,
                    endIndent: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Text(
                          'सामग्रीहरू',
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        CircleAvatar(
                          backgroundColor: Color(0xFFFFC529),
                          maxRadius: 10,
                          child: Text(
                            '${recipeList[0].ingredients.length}',
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
                childAspectRatio: 2),
            delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
                return SingleChildScrollView(
                  child: Column(
                    children: <Widget>[
                      Card(
                          elevation: 7,
                          shape: CircleBorder(
                              side: BorderSide(color: Colors.white)),
                          child: Center(
                            child: ingridientWidget(index),
                          )),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FittedBox(
                          alignment: Alignment.center,
                          child: Container(
                              child: Text(
                            recipeList[0].ingredients.values.elementAt(index),
                            style: kNepaliTextStyle.copyWith(
                                fontSize: 15, fontWeight: FontWeight.bold),
                          )),
                        ),
                      )
                    ],
                  ),
                );
              },
              childCount: recipeList[0].ingredients.length,
            ),
          ),
          SliverPadding(
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 15),
              sliver: SliverToBoxAdapter(
                child: Text('पकाउने तरिका', style: kNepaliTextStyle),
              )),
          SliverPadding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            sliver: SliverList(
                delegate: SliverChildListDelegate(List.generate(20, (index) {
              return Container(
                height: 50,
                width: 100,
                child: Text('Hello it worked'),
              );
            }))),
          )
        ],
      )),
    );
  }

  Widget ingridientWidget(int index){
  //  await getJsonData(recipeList[0].ingredients.keys.elementAt(index));
    return  CircleAvatar(
                              backgroundImage: NetworkImage( getJsonData(recipeList[0].ingredients.keys.elementAt(index))),
                              radius: 25,
                            );
    } 
}
