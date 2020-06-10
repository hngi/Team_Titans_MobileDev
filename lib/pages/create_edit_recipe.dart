import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/recipe.dart';
import '../provider/recipes.dart';

class CreateEditRecipe extends StatefulWidget {
  static const routeName = "edit-recipe";
  @override
  _CreateEditRecipeState createState() => _CreateEditRecipeState();
}

class _CreateEditRecipeState extends State<CreateEditRecipe> {
  //set Global form key
  final GlobalKey<FormState> _formStatekey = GlobalKey<FormState>();

  
  var _editedRecipe = Recipe(id: null, title: '', ingredients: '', author: '');
  var _isInit = true;

  //wE USE INITIAL VALUES BECAUSE OUR FORM ALSO EDITS PRODUCTS
  var _initValues = {
    'title': '',
    'author': '',
    'ingredients': '',
  };

//THis function validates input to ensure they are not empty
  String _validateItemRequired(String value) {
    return value.isEmpty ? 'Item Required' : null;
  }


  @override
  void didChangeDependencies() {
    if (_isInit) {
      final recipeID = ModalRoute.of(context).settings.arguments as String;
      if (recipeID != null) {
        _editedRecipe = Provider.of<Recipes>(context).findById(recipeID);
        //SETS INITIAL VALUES OF FORMM FIELDS IF IT EHAS AN ID
        _initValues = {
          'title': _editedRecipe.title,
          'author': _editedRecipe.author,
          'body': _editedRecipe.ingredients,
        };
      }
    }
    _isInit = false;
    super.didChangeDependencies();
  }


  void _submitOrder() {
    /*
    This function performs the action of create and editing recipes. Do no make changes 
    unloess you are giuven permission
     */
    if (_formStatekey.currentState.validate()) {
      _formStatekey.currentState.save();
      if(_editedRecipe.id != null){
        //if recipes has an id use the updaterecipe method otherwise create a new recipe
        Provider.of<Recipes>(context, listen: false).updateRecipe(_editedRecipe.id, _editedRecipe);
        Navigator.of(context).pop();
      }else{
        Provider.of<Recipes>(context, listen: false).addRecipe(_editedRecipe);
        Navigator.of(context).pop();
      }
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe App'),
      ),
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Form(
              key: _formStatekey,
              autovalidate: false,
              /* If true, form fields will validate and update their 
              error text immediately after every change.
               Otherwise, you must call [FormState.validate] to validate. */
              child: Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(children: <Widget>[
                  TextFormField(
                    /*
                      If you lack understanding of this section read on the form widet                      
                     */
                    decoration: InputDecoration(
                      hintText: 'Express Chef',
                      labelText: 'Author',
                    ),
                    initialValue: _initValues['author'],
                    //Initial value acts like a Text Controllerr but you can't use both
                    validator: (value) => _validateItemRequired(value),
                    onSaved: (value) => _editedRecipe = Recipe(
                        id: _editedRecipe.id,
                        title: _editedRecipe.title,
                        ingredients: _editedRecipe.ingredients,
                        author: value,
                          ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Oat Soup',
                      labelText: 'Title',
                    ),
                     initialValue: _initValues['title'],
                    validator: (value) => _validateItemRequired(value),
                    onSaved: (value) => _editedRecipe = Recipe(
                        id: _editedRecipe.id,
                        title: value,
                        ingredients: _editedRecipe.ingredients,
                        author: _editedRecipe.author,
                        ),
                  ),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'I add Tomatos',
                      labelText: 'Ingredients',
                    ),
                     initialValue: _initValues['body'],
                    validator: (value) => _validateItemRequired(value),
                    onSaved: (value) => _editedRecipe = Recipe(
                        id: _editedRecipe.id,
                        title: _editedRecipe.title,
                        ingredients: value,
                        author: _editedRecipe.author,
                        ),
                  ),
                  Divider(
                    height: 32.0,
                  ),
                  RaisedButton(
                    child: Text('Save'),
                    color: Colors.teal,
                    onPressed: () {
                      _submitOrder();
                    } 
                  )
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}