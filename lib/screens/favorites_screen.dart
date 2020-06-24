import 'package:flutter/material.dart';
import 'package:food/models/favorites_list.dart';
import 'package:provider/provider.dart';

class FavoriteScreen extends StatefulWidget {
  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<FavoritesList>(builder: (context, snapshot, _) {
      return SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text('My Favorites'),
          ),
          body: ListView.builder(
              itemCount: 5,
              itemBuilder: (context, int index) {
                return Container(
                  child: Text('${snapshot.favLength} items'),
                );
              }),
        ),
      );
    });
  }
}
