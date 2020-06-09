import 'package:flutter/foundation.dart';

//Recipe Class
class Recipe with ChangeNotifier{
  String id;
  String title;
  String ingredients;
  String author;

  //Recipe Constructor+
  Recipe({
    @required this.id,
    @required this.title,
    @required this.ingredients,
    @required this.author,
  });

/*
  Do not touch this block of code !!!!
  void toggleFavoriteStatus(){
    isFavorite = !isFavorite;
    notifyListeners();
  }
*/
}

