import 'package:flutter/material.dart';
import 'package:food/BMI_feature/input_page.dart';
import 'package:food/constants.dart';

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
              physics: BouncingScrollPhysics(),
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:15.0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context)=> InputPage()));
                    },
                                    child: Container(
                                      
                      height: 80,
                      width: double.infinity,
                      child: Center(
                          child: Text(
                        "Calculate My BMI",
                        style: kEnglishTextStyle,
                      )),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(colors: [
                            Colors.orange,
                            Colors.orangeAccent,
                            kMainColor,
                            Colors.yellowAccent
                          ], begin: Alignment.bottomLeft, end: Alignment.topRight)),
                    ),
                  ),
                )
              ],
            ),
          )),
    );
  }
}
