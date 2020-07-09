import 'package:flutter/material.dart';
import 'package:food/models/recipe_list.dart';
import 'package:food/screens/cooking_screen.dart';

class ArticleSearch extends SearchDelegate {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          icon: Icon(Icons.clear),
          onPressed: () {
            query = '';
          }),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        icon: Icon(Icons.arrow_back),
        onPressed: () {
          close(context, null);
        });
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(child: Text('Look for it in food List'));
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<dynamic> myList = [];

    myList = recipeList.where((element) {
      return element.ename.toLowerCase().contains(query.toLowerCase());
    }).toList();

    if (myList.isNotEmpty) {
      return ListView.builder(
          itemCount: myList.length > 5 ? 5 : myList.length,
          itemBuilder: (context, int index) {
            return GestureDetector(
                onTap: () {
                  int myIndex = recipeList.indexOf(myList[index]);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CookingScreen(
                                indexOfFood: myIndex,
                              )));
                },
                child: ListTile(
                  title: Text(myList[index].ename),
                ));
          });
    }
    return Text('no suggestion found');
  }
}
