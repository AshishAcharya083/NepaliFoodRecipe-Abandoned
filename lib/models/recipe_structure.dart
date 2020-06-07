import 'package:flutter/material.dart';
enum MainItem{ fruit , vegetable , meat}
class RecipeStructure {
  Map<String, String> ingredients;
  List<String> stepsForCooking;
  String name;
  String ename;
  String description;
  bool veg;
  String image;
  MainItem mainItem;

  
  

  RecipeStructure(
      {@required this.name,
      this.ename,
      this.mainItem,
      this.veg,
      this.description,
      this.ingredients,
      this.stepsForCooking,
      
      this.image});
    
}
