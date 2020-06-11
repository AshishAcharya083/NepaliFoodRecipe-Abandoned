import 'package:flutter/material.dart';
import 'package:food/constants.dart';
import 'package:food/models/searching.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        showSearch(
          context: context,
          delegate: ArticleSearch(),
        );
      },
      child: Card(
        elevation: 4.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            IconButton(
              onPressed: () {
                showSearch(
                  context: context,
                  delegate: ArticleSearch(),
                );
              },
              padding: EdgeInsets.symmetric(horizontal: 10),
              icon: Icon(
                Icons.search,
                size: 30,
                color: kMainColor,
              ),
              color: Colors.black87,
            ),
            Flexible(
              child: TextField(
                enabled: false,
                style: TextStyle(
                  fontFamily: 'Jost',
                  fontWeight: FontWeight.w500,
                  fontSize: 20.0,
                ),
                decoration: new InputDecoration(
                    border: InputBorder.none,
                    focusedBorder: InputBorder.none,
                    enabledBorder: InputBorder.none,
                    errorBorder: InputBorder.none,
                    disabledBorder: InputBorder.none,
                    contentPadding: EdgeInsets.only(
                        left: 15, bottom: 11, top: 11, right: 15),
                    hintText: 'Search Foods'),
              ),
            ),
        
          ],
        ),
      ),
    );
  }
}
