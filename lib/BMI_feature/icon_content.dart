import 'package:flutter/material.dart';
import 'package:food/constants.dart';
import 'constants.dart';



class IconContent extends StatelessWidget {
  IconContent({@required this.icon, @required this.genderText});
  final String genderText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon,size: 80.0,color: kMainColor,),
        SizedBox(
          height: 15.0,
        ),
        Text(
          genderText,
          style: kLabelTextStyle,
        )
      ],
    );
  }
}
