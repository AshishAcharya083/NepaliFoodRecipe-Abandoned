import 'package:food/BMI_feature/calculator_brain.dart';
import 'package:flutter/material.dart';
import 'package:food/constants.dart';
import 'constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'resusable_card.dart';
import 'result_screen.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 180;
  int weight = 60;
  int age = 18;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          
          title: Text('BMI CALCULATOR',style: kEnglishTextStyle.copyWith(fontSize: 30,letterSpacing: 0),),
          elevation: 0,
          backgroundColor: Colors.transparent,
          iconTheme: IconThemeData(
            color: Colors.orangeAccent,
            size: 30,
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                        onPress: () {
                          setState(() {
                            selectedGender = Gender.male;
                          });
                        },
                        cardChild: IconContent(
                          
                            icon: FontAwesomeIcons.mars, genderText: 'MALE'),
                        colour: selectedGender == Gender.male
                            ? kActiveCardColor
                            : kInactiveCardColor)),
                Expanded(
                    child: ReusableCard(
                  onPress: () {
                    setState(() {
                      selectedGender = Gender.female;
                    });
                  },
                  cardChild: IconContent(
                      icon: FontAwesomeIcons.venus, genderText: 'FEMALE'),
                  colour: selectedGender == Gender.female
                      ? kActiveCardColor
                      : kInactiveCardColor,
                ))
              ],
            )),
            Expanded(
                child: ReusableCard(
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'HEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(height.toString(), style: kNumberTextStyle),
                            Text('cm', style: kLabelTextStyle),
                          ],
                        ),
                        SliderTheme(
                          data: SliderTheme.of(context).copyWith(
                              activeTrackColor: Colors.white,
                              inactiveTrackColor: Color(0xFF8D8E98),
                              thumbColor: kMainColor,
                              overlayColor: kMainColor.withOpacity(0.2),
                              thumbShape: RoundSliderThumbShape(
                                  enabledThumbRadius: 15.0),
                              overlayShape:
                                  RoundSliderOverlayShape(overlayRadius: 30.0)),
                          child: Slider(
                            value: height.toDouble(),
                            max: 220,
                            min: 90,
                            onChanged: (double newValue) {
                              setState(() {
                                height = newValue.round();
                              });
                            },
                          ),
                        )
                      ],
                    ),
                    colour: kActiveCardColor)),
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                    child: ReusableCard(
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text('WEIGHT', style: kLabelTextStyle),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          RoundIconButton(
                            icon: FontAwesomeIcons.minus,
                            onpressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                          ),
                          SizedBox(
                            width: 10.0,
                          ),
                          RoundIconButton(
                            icon: FontAwesomeIcons.plus,
                            onpressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                          )
                        ],
                      )
                    ],
                  ),
                  colour: kActiveCardColor,
                )),
                Expanded(
                  child: ReusableCard(
                    cardChild: Column(
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onpressed: () {
                                  setState(() {
                                    age--;
                                  });
                                }),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onpressed: () {
                                  setState(() {
                                    age++;
                                  });
                                })
                          ],
                        )
                      ],
                    ),
                    colour: kActiveCardColor,
                  ),
                )
              ],
            )),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:15.0),
              child: BottomButton(
                buttonText: 'CALCULATE',
                onButtonPressed: () {
                  CalculatorBrain calc =
                      CalculatorBrain(weight: weight, height: height);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => ResultScreen(
                                bmiResult: calc.calculateBMI(),
                                interpretation: calc.getInterpretation(),
                                resultText: calc.getResults(),
                              )));
                },
              ),
            )
          ],
        ));
  }
}

class RoundIconButton extends StatelessWidget {
  RoundIconButton({@required this.icon, @required this.onpressed});
  final IconData icon;
  final Function onpressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
        constraints: BoxConstraints.tightFor(
          width: 56.0,
          height: 56.0,
        ),
        elevation: 6.0,
        child: Icon(icon),
        onPressed: onpressed,
        shape: CircleBorder(),
        fillColor: kMainColor

        //  Color(0xFF4C4F5E),
        );
  }
}
