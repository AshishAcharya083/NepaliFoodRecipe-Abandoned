import 'package:flutter/material.dart';
import 'package:food/constants.dart';
import 'constants.dart';
import 'bottom_button.dart';

class ResultScreen extends StatelessWidget {
  ResultScreen(
      {@required this.resultText,
      @required this.bmiResult,
      @required this.interpretation});
  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Expanded(
                  child: Container(
                    
                    alignment: Alignment.center,
                    child: Text(
                      'Your Result',
                      
                      style: kEnglishTextStyle.copyWith(
                          fontSize: 40, letterSpacing: 0),
                    ),
                  ),
                ),
                Expanded(
                    flex: 6,
                    child: Container(
                      // margin: EdgeInsets.fromLTRB(10.0, 20.0, 10.0, 20.0),

                      decoration: BoxDecoration(
                          color: kActiveCardColor,
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            resultText.toUpperCase(),
                            style: TextStyle(
                                fontSize: 20.0, color: Color(0xFF25D876)),
                          ),
                          Text(bmiResult,
                              style: kEnglishTextStyle.copyWith(
                                  fontSize: 70,
                                  letterSpacing: 0,
                                  color: kMainColor)),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              interpretation,
                              textAlign: TextAlign.center,
                              style: kEnglishTextStyle.copyWith(
                                  color: Colors.white, letterSpacing: 0),
                            ),
                          )
                        ],
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:8.0),
                  child: Expanded(
                      child: BottomButton(
                          buttonText: 'RE-CALCULATE',
                          onButtonPressed: () {
                            Navigator.pop(context);
                          })),
                )
              ]),
        ),
      ),
    );
  }
}
