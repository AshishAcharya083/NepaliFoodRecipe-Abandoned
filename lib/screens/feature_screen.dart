import 'package:flutter/material.dart';
import 'package:food/BMI_feature/input_page.dart';
import 'package:food/constants.dart';
import 'package:food/Water_feature/WaterScreen.dart';

class FeatureScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: Text(
              'HEALTH',
              style: kNepaliTextStyle.copyWith(fontSize: 30),
            ),
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
          body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 10),
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => InputPage()));
                    },
                    child: ListItem(
                      listOfColors: [
                        Colors.orange,
                        Colors.orangeAccent,
                        kMainColor,
                        Colors.yellowAccent
                      ],
                      title: 'Calculate My BMI',
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  child: GestureDetector(
                    onTap: ()
                    {
                      Navigator.push(context,MaterialPageRoute(builder: (context) => WaterScreen()));
                    },
                                      child: ListItem(
                        title: 'WATER Drinking Remainder',
                        listOfColors: [
                          Colors.blueAccent,
                          Colors.lightBlue,
                          Colors.lightBlueAccent
                        ]),
                  ),
                ),
              ],
            ),
          )),
    );
  }
}

class ListItem extends StatelessWidget {
  final String title;
  final List<Color> listOfColors;

  ListItem({@required this.title, @required this.listOfColors});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      elevation: 5,
      child: Container(
        height: 80,
        width: double.infinity,
        child: Center(
            child: Text(
          title,
          style: kEnglishTextStyle,
        )),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
                colors: listOfColors,
                begin: Alignment.bottomLeft,
                end: Alignment.topRight)),
      ),
    );
  }
}
