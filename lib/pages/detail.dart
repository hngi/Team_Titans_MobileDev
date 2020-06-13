import 'package:flutter/material.dart';
import 'package:recipe/utils/class.dart';
import 'package:recipe/utils/widgets.dart';

class DetailsPage extends StatelessWidget {
  final Recipe recipe;
  final LocalRecipe localrecipe;
  DetailsPage({this.recipe, this.localrecipe});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
          return <Widget>[
            SliverAppBar(
              expandedHeight: 200.0,
              floating: false,
              pinned: true,
              backgroundColor: Color(0xff8DB646),
              title: Text(recipe == null ? localrecipe.title : recipe.title),
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: recipe == null ? localrecipe.id : recipe.id,
                  child: FadeInImage(
                    image: recipe == null
                        ? AssetImage(localrecipe.imageUrl)
                        : NetworkImage(recipe.imageUrl),
                    fit: BoxFit.cover,
                    placeholder: AssetImage('assets/images/loading.gif'),
                  ),
                ),
              ),
            ),
          ];
        },
        body: Container(
          decoration: BoxDecoration(color: Colors.white),
          padding: EdgeInsets.only(top: 8.0),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Column(
              children: <Widget>[
                Text('Nutrition',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                SizedBox(
                  height: 10,
                ),
                NutritionWidget(
                  nutrients:
                      recipe == null ? localrecipe.nutrients : recipe.nutrients,
                ),
                SizedBox(
                  height: 10,
                ),
                Text('Ingredients',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                IngredientsWidget(
                  ingredients: recipe == null
                      ? localrecipe.ingredients
                      : recipe.ingredients,
                ),
                Divider(
                  height: 10,
                ),
                Text('Steps',
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
                RecipeSteps(
                  steps: recipe == null ? localrecipe.steps : recipe.steps,
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RecipeSteps extends StatelessWidget {
  final List<String> steps;
  RecipeSteps({this.steps});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: steps.length,
      shrinkWrap: true,
      physics: ClampingScrollPhysics(),
      scrollDirection: Axis.vertical,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundColor: Color(0xff8DB646),
                child: Text('${index + 1}',
                    style: TextStyle(
                        color: Colors.black, fontWeight: FontWeight.bold)),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(steps[index],
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 16,
                          fontFamily: 'Source_Sans_Pro')),
                ),
              )
            ],
          ),
        );
      },
    );
  }
}

class IngredientsWidget extends StatelessWidget {
  final List<String> ingredients;
  IngredientsWidget({this.ingredients});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ingredients.length,
      shrinkWrap: true,
      scrollDirection: Axis.vertical,
      physics: ClampingScrollPhysics(),
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(ingredients[index],
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                  fontFamily: 'Source_Sans_Pro')),
        );
      },
    );
  }
}

class NutritionWidget extends StatelessWidget {
  final List<Nutrients> nutrients;
  NutritionWidget({this.nutrients});
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 86,
      width: double.infinity,
      child: ListView.builder(
        itemCount: nutrients.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (BuildContext context, int index) {
          return CircleIndicator(
            percent: nutrients[index].percent,
            nutrient: nutrients[index],
          );
        },
      ),
    );
  }
}
