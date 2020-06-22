import 'package:flutter/foundation.dart';

class FavoritesList extends ChangeNotifier{

  List<int> favorites = [1,2,4];

  void addIndex(int index){
    favorites.add(index);
    notifyListeners();
  }
}