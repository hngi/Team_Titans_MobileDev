
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/recipes.dart';


class ViewRecipe extends StatelessWidget {
  static const routeName = "view-recipe";

  @override
  Widget build(BuildContext context) {
    final itemId = ModalRoute.of(context).settings.arguments as String;
    final loadedItem = Provider.of<Recipes>(context,listen: false).findById(itemId);
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
            Text('Ttitle: ${loadedItem.title}'),
            Text('Author: ${loadedItem.author}'),
            Text('Ingredients: ${loadedItem.ingredients}'),

        ],)
        
        
      ),
    );
  }
}