import 'package:flutter/material.dart';

class RecipeStructure{

  List<String> ingredients;
  List<String> stepsForCooking;
  String foodTitle;
  int upVotes;

  RecipeStructure({@required this.foodTitle,this.ingredients,this.stepsForCooking,this.upVotes});
  
}