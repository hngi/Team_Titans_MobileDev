import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'recipe.dart';

class Recipes with ChangeNotifier {
  
  //This list stoes all recipes
  List<Recipe> _items = [
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

Future<void> fetchAndSetProducts() async {
    const url =  "https://ounje-3854d.firebaseio.com/recipe.json";
    try {
      final response = await http.get(url);
      final extractedData = json.decode(response.body) as Map<String, dynamic>;
      final List<Recipe> loadedRecipe = [];
      extractedData.forEach((recipeId, recipeData) {
        loadedRecipe.add(Recipe(
          id: recipeId,
          imageUrl: recipeData['imageUrl'],
          author: recipeData['author'],
          title: recipeData['title'],
          description: recipeData['descriptioon'],
          time: recipeData['time'],
          ingredients: recipeData['ingredients'],
          steps: recipeData['steps'],

        ));
      });
      _items = loadedRecipe;
      notifyListeners();
    } catch (error) {
      throw (error);
    }
  }

  Future<void>  addRecipe(Recipe recipe) async{
    const url =  "https://ounje-3854d.firebaseio.com/recipe.json";
    try {
      final response = await http.post(
        url,
        body: json.encode({
          'title': recipe.title,
          'imageUrl' : recipe.imageUrl,
          'author' : recipe.author,
          'description' : recipe.description,
          'time': recipe.title,
          'ingredients': recipe.ingredients,
          'steps' : recipe.steps
        }),
      );
    final newRecipe = Recipe(
      id: DateTime.now().toString(),
      title: recipe.title, 
      imageUrl: recipe.imageUrl, 
      author: recipe.author,
      description: recipe.description,
      time: recipe.time,
      ingredients: recipe.ingredients,
      steps: recipe.steps
    );
    _items.add(newRecipe);
    notifyListeners();
    } catch(error) {
      print(error);
      throw error;
    }
  }

  Future<void> updateRecipe(String id, Recipe editedRecipe) async{
     final recipeIndex = _items.indexWhere((recipe) => recipe.id==id);
     if(recipeIndex >= 0 ){
        final url =  "https://ounje-3854d.firebaseio.com/recipe/$id.json";
        await http.patch(url,
          body:json.encode({
          'title': editedRecipe.title,
          'imageUrl' : editedRecipe.imageUrl,
          'author' : editedRecipe.author,
          'description' : editedRecipe.description,
          'time': editedRecipe.title,
          'ingredients': editedRecipe.ingredients,
          'steps' : editedRecipe.steps
          })
        );
        _items[recipeIndex] = editedRecipe;
       notifyListeners();
     }else{
       print('...');
     }
    
    //Recipes a re updates based on their index in the list
   
    //Notift listners send an update to the entire application when changes are made
   
  }
  
  Future<void> deleteRecipe(String id) async{
    final url =  "https://ounje-3854d.firebaseio.com/recipe/$id.json";
    final existingRecipeIndex = _items.indexWhere((recipe) => recipe.id==id);
    var existingRecipe = _items[existingRecipeIndex];
    _items.removeAt(existingRecipeIndex);
    notifyListeners();
    final response = await http.delete(url);
      if (response.statusCode >= 400){
        _items.insert(existingRecipeIndex, existingRecipe);
        notifyListeners();
        throw HttpException('Could not delete recipe');
      }
      existingRecipe = null;
  }
}