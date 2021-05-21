import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final List<BoxShadow> kboxShadow = [
  BoxShadow(
      color: Colors.black.withOpacity(0.2), blurRadius: 10, spreadRadius: 5)
];

final kNepaliTextStyle = GoogleFonts.getFont('Hind',
    textStyle: TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        letterSpacing: 1.5,
        wordSpacing: 1.5));

final kEnglishTextStyle = GoogleFonts.getFont('Hind',
    textStyle: TextStyle(
        fontWeight: FontWeight.bold, fontSize: 20, color: Colors.black));

const kMainColor = Color(0xFFFFC529);
const errorImage =
    'https://firebasestorage.googleapis.com/v0/b/food-recipes-in-nepali.appspot.com/o/404.jpg?alt=media&token=66b1ec68-1687-45e8-9f57-c5a8101c7016';

const placementId = '974319406331493_975315352898565';
//change
