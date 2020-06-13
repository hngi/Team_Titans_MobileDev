import 'package:flutter/foundation.dart';

//Recipe Class
class Recipe with ChangeNotifier{
  String id,title,imageUrl,author,description;
  double time;
  List<String> ingredients;
  List<String> steps;

  //Recipe Constructor+
  Recipe({
    @required this.id, 
    @required this.title,
    @required this.imageUrl,
    @required this.author,
    @required this.description,
    @required this.time,
    @required this.ingredients,
    @required this.steps,
  });

/*
  Do not touch this block of code !!!!
  void toggleFavoriteStatus(){
    isFavorite = !isFavorite;
    notifyListeners();
  }
*/
}

