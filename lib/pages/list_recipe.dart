import 'package:flutter/material.dart';
import '../widget/list_items.dart';
import 'create_edit_recipe.dart';

/*
enum FilterOptions {
  Favorites,
  All
}
*/



class ListRecipe extends StatefulWidget {
  @override
  _ListRecipeState createState() => _ListRecipeState();
}

class _ListRecipeState extends State<ListRecipe> {
  //var _showOnlyFavorites = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text('Recipe App'),
        backgroundColor: Colors.blue,
        leading: Icon(
          Icons.note
        ),
        centerTitle: true,
        /*
        This code will be used later
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            onSelected: (FilterOptions selectedValue) {
              setState(() {
              if(selectedValue == FilterOptions.Favorites){
                _showOnlyFavorites = true;
              }else{
                _showOnlyFavorites = false;
              }
              });
            },
            itemBuilder: (_) => [
              PopupMenuItem(
                child: Text('Only Favorites'),
                value: FilterOptions.Favorites,
              ),
               PopupMenuItem(
                child: Text('Show All'),
                value: FilterOptions.All,
              ),
            ]
            )
        ],*/
        
      ),
      body: ListItems(),
      floatingActionButton: FloatingActionButton(
        child: IconButton(
        onPressed: (){
          Navigator.of(context).pushNamed(CreateEditRecipe.routeName);
        },
          icon: Icon(
            Icons.add,
            color: Colors.white,
          ),
          ),
        backgroundColor: Colors.blue[900],
        ),
    );
  }
}