import 'package:flutter/material.dart';

class SearchBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Card(
      // margin: EdgeInsets.symmetric(horizontal: 10),
      elevation: 4.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            GestureDetector(
              onTap: () {
               //TODO: code the drawer menu
              },
              child: Icon(
                Icons.search,
                color: Colors.black87,
                size: 30.0,
              ),
            ),
            Flexible(
              child: TextField(
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
            // GestureDetector(
            //   child: CircleAvatar(
            //     radius: 18.0,
            //     backgroundImage: AssetImage('assets/images/profile.jpg'),
            //   ),
            //   onTap: () {
            //     // showDialog(
            //     //     context: context,
            //     //     builder: (BuildContext context) {
            //     //       return AccountInfo();
            //     //     });
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}