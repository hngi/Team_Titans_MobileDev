import 'dart:math';
import 'package:recipe/const/colors.dart';
import 'package:recipe/pages/detail.dart';
import 'package:recipe/provider/recipe.dart';
import 'package:recipe/utils/data.dart';
import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/scaled_tile.dart';
import 'package:flutter/material.dart';

class Post {
  final String title;
  final String body;

  Post(this.title, this.body);
}

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final SearchBarController<Post> _searchBarController = SearchBarController();
  bool isReplay = false;

  Future<List<Recipe>> getALlPosts(String text) async {
    await Future.delayed(Duration(seconds: text.length == 4 ? 10 : 1));
    List<Recipe> recipe = [];

    var random = new Random();
    for (int i = 0; i < 10; i++) {
      recipe.add(
        Recipe(
            id: '${Data.recipes[i].id}',
            title: '${Data.recipes[i].title}',
            ingredients: '${Data.recipes[i].ingredients}',
            author: '${Data.recipes[i].title}'),
      );
    }
    return recipe;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SearchBar<Recipe>(
          searchBarPadding: EdgeInsets.symmetric(horizontal: 10),
          headerPadding: EdgeInsets.symmetric(horizontal: 10),
          listPadding: EdgeInsets.symmetric(horizontal: 10),
          onSearch: getALlPosts,
          searchBarController: _searchBarController,
          placeHolder: Center(
              child: Text(
            "Under Construction",
            style: TextStyle(
                color: authTextColor,
                fontStyle: FontStyle.normal,
                fontWeight: FontWeight.normal,
                fontSize: 30),
          )),
          cancellationWidget: Text("Cancel"),
          emptyWidget: Text("empty"),
          indexedScaledTileBuilder: (int index) =>
              ScaledTile.count(1, index.isEven ? 2 : 1),
          onCancelled: () {
            print("Cancelled triggered");
          },
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          onItemFound: (Recipe recipe, int index) {
            return Container(
              color: Colors.lightBlue,
              child: ListTile(
                title: Text(recipe.title),
                isThreeLine: true,
                subtitle: Text(recipe.author),
                onTap: () {
                  // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Detail()));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
