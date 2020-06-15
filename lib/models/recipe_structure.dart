import 'package:flutter/material.dart';

enum MainItem { fruit, vegetable, meat, fish,milk}
enum Category{sickFood,sweet}
class RecipeStructure {
  Map<String, String> ingredients;
  List<String> stepsForCooking;
  String name;
  String ename;
  String description;
  bool veg;
  bool popular;
  String image;
  MainItem mainItem;
  Category category;

  RecipeStructure(
      {@required this.name,
      this.ename,
      this.mainItem,
      this.veg,
      this.popular,
      this.category,
      this.image,
      this.description,
      this.ingredients,
      this.stepsForCooking,
      });
}
