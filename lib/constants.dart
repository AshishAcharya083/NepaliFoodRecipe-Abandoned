import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final List<BoxShadow> kboxShadow = [
  BoxShadow(
      color: Colors.black.withOpacity(0.2), blurRadius: 10, spreadRadius: 5)
];

final kNepaliTextStyle = GoogleFonts.getFont('Hind',
    textStyle: TextStyle(fontSize: 20,
    fontWeight: FontWeight.bold,
     letterSpacing: 1.5, wordSpacing: 1.5));


final kEnglishTextStyle = GoogleFonts.getFont('Hind',

textStyle: TextStyle(
  letterSpacing: 1.2,
  fontWeight: FontWeight.bold,
  fontSize: 20,
  color: Colors.black


));

const kMainColor = Color(0xFFFFC529);

