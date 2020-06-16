import 'package:flutter/material.dart';

import 'constants.dart';
class BottomButton extends StatelessWidget {
  BottomButton({@required this.buttonText, @required this.onButtonPressed});
  final String buttonText;
  final Function onButtonPressed;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onButtonPressed,
      child: Container(
        decoration: BoxDecoration(
          color: kBottomContainerColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: Center(child: Text(buttonText, style: kLargeButtonTextStyle)),
        width: double.infinity * 0.8,
        height: 80,
      ),
    );
  }
}
