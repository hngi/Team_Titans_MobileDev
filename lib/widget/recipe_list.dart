import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../pages/create_edit_recipe.dart';
import '../pages/view_recipe.dart';
import '../provider/recipe.dart';
import '../provider/recipes.dart';

class RecipeItem extends StatelessWidget {
 final String id;
 final String title;
 final String author;
 final String  ingredients;

 RecipeItem(this.id,this.title,this.author,this.ingredients);
  @override
  Widget build(BuildContext context) {
    final recipe = Provider.of<Recipe>(context);
    return InkWell(
        child: Container(
            child: Card(
              child: Padding(
                padding: EdgeInsets.all(16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Icon(Icons.fastfood),
                    Column(
                      children: <Widget>[
                        Text('$title'),
                      ],
                    ),
                    /*
                        IconButton(
                  icon: Icon(
                      note.isFavorite ? Icons.favorite : Icons.favorite_border),
                  onPressed: () => note.toggleFavoriteStatus(),
                ),
                */
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () => Navigator.pushNamed(
                          context, CreateEditRecipe.routeName,
                          arguments: recipe.id),
                    ),
                    IconButton(
                        icon: Icon(Icons.delete),
                        onPressed: () {
                          Provider.of<Recipes>(context, listen: false)
                              .deleteRecipe(recipe.id);
                        })
                  ],
                ),
              ),
            ),
          ),
          onTap: () => Navigator.of(context).pushNamed(ViewRecipe.routeName, arguments: recipe.id),
        );
  }
}