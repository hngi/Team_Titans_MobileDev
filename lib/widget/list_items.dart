import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/recipes.dart';

import 'recipe_list.dart';

class ListItems extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final recipeData = Provider.of<Recipes>(context);
    final recipes = recipeData.items;
    return ListView.builder(
      itemCount: recipes.length,
      itemBuilder: (ctx, i) => ChangeNotifierProvider(
        builder: (c) => recipes[i],
        child: RecipeItem(
          recipes[i].id,
          recipes[i].title,
          recipes[i].author,
          recipes[i].ingredients,
        )
      ),
    );
  }
}
