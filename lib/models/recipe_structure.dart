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
      this.ename = 'Food Name',
      this.mainItem,
      this.veg = true,
      this.popular = false,
      this.category,
      this.image = "https://images.unsplash.com/photo-1558467523-46113f1fcf72?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1489&q=80",
      this.description = 'Popular Food',
      this.ingredients  = const {'food ingredient':'various food Ingredient'},
      this.stepsForCooking = const ['comming soon','Coming soon'],
      });
}
