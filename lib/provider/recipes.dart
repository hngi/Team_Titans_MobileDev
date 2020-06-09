import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'recipe.dart';

class Recipes with ChangeNotifier {
  
  //This list stoes all recipes
  List<Recipe> _items = [
    Recipe(
      id:'1',
      author: 'daliseiy',
      title: 'Fall of Avhillies',
      ingredients: "oiffwee",
      ),
      Recipe(
      id:'2',
      author: 'daliseiy',
      title: 'Agewons cinquwsr',
      ingredients: "oiffwee",
      )
  ];

  //var _showFavoritesOnly = false; 

  List<Recipe> get items {
    return [..._items];

  }

/*
  List<Recipe> get favoriteRecipe {
    return _items.where((Recipe) => Recipe.isFavorite).toList( );

  }
  */
  
  Recipe findById(String id){
    /*
      Returns recipe  object in ny it's id
     */
    return _items.firstWhere((recipe) => recipe.id == id);
  }

  void addRecipe(Recipe recipe) {
    /*
    Adds a new recipe to the list of Recipes
     */
    final newRecipe = Recipe(id: DateTime.now().toString(),title: recipe.title,author: recipe.author,ingredients: recipe.ingredients);
    _items.add(newRecipe);
    notifyListeners();
  }

  void updateRecipe(String id, Recipe editedRecipe){
    //Recipes a re updates based on their index in the list
    final recipeIndex = _items.indexWhere((recipe) => recipe.id==id);
      _items[recipeIndex] = editedRecipe;
    //Notift listners send an update to the entire application when changes are made
    notifyListeners();
  }
  
  void deleteRecipe(String id){
    //Remove recipe from list of Recipes
    _items.removeWhere((recipe) => recipe.id==id);
    notifyListeners();
  }
}