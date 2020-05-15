import 'package:flutter/material.dart';
import 'package:food/constants.dart';
import 'package:food/models/recipe_list.dart';
import 'package:food/models/recipe_structure.dart';
import 'package:food/stepList.dart';

class CookingScreen extends StatelessWidget {
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
          backgroundColor: Colors.transparent,
          elevation: 0,
          expandedHeight: 200.0,
          floating: true,
          pinned: false,
          flexibleSpace: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: FlexibleSpaceBar(
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
                        'Ingredients ',
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
                          '7',
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
                        shape:
                            CircleBorder(side: BorderSide(color: Colors.white)),
                        child: Center(
                          child: CircleAvatar(
                            backgroundImage: NetworkImage(
                              '', // fetch image from unsplash API
                            ),
                            radius: 25,
                          ),
                        )),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(child: Text(recipeList[0].ingredients.values.elementAt(index),style: kNepaliTextStyle.copyWith(fontSize: 15,fontWeight: FontWeight.bold),)),
                    )
                  ],
                ),
              );
            },
            childCount: recipeList[0].ingredients.length,
          ),
        ),
      
        
      ],
    )
      ),
    );
  }
}

