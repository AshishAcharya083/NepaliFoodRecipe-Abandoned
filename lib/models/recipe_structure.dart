import 'package:flutter/material.dart';

enum MainItem { fruit, vegetable, meat, fish,milk}
enum Category{sickFood,sweet,drinks}
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
      this.ename = 'Food Name',
      this.mainItem,
      this.veg = true,
      this.popular = false,
      this.category,
      this.image = "https://firebasestorage.googleapis.com/v0/b/food-recipes-in-nepali.appspot.com/o/404.jpg?alt=media&token=66b1ec68-1687-45e8-9f57-c5a8101c7016",
      this.description = 'Popular Food',
      this.ingredients  = const {'food ingredient':'various food Ingredient'},
      this.stepsForCooking = const ['comming soon','Coming soon'],
      });
}
