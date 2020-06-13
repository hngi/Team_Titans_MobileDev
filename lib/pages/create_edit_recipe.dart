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
  List ingrid = [];
  List mysteps = [];
  var _editedRecipe = Recipe(
      id: null,
      title: '',
      imageUrl: '',
      author: '',
      description: '',
      time: 0,
      ingredients: [],
      steps: []);
  var _isInit = true;

  //wE USE INITIAL VALUES BECAUSE OUR FORM ALSO EDITS PRODUCTS
  var _initValues = {
    'title': '',
    'imageUrl': '',
    'author': '',
    'description': '',
    'time': 0,
    'ingredients': [],
    'steps': [],
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
          'imageUrl': _editedRecipe.imageUrl,
          'author': _editedRecipe.author,
          'description': _editedRecipe.description,
          'time': _editedRecipe.time,
          'ingredients': _editedRecipe.ingredients,
          'steps': _editedRecipe.steps,
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
      if (_editedRecipe.id != null) {
        //if recipes has an id use the updaterecipe method otherwise create a new recipe
        Provider.of<Recipes>(context, listen: false)
            .updateRecipe(_editedRecipe.id, _editedRecipe);
        Navigator.of(context).pop();
      } else {
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
                      author: value,
                      imageUrl: _editedRecipe.imageUrl,
                      description: _editedRecipe.description,
                      time: _editedRecipe.time,
                      ingredients: ingrid,
                      steps: _editedRecipe.steps,
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
                      author: _editedRecipe.author,
                      imageUrl: _editedRecipe.imageUrl,
                      description: _editedRecipe.description,
                      time: _editedRecipe.time,
                      ingredients: ingrid,
                      steps: _editedRecipe.steps,
                    ),
                  ),
                   TextFormField(
                    decoration: InputDecoration(
                      hintText: '',
                      labelText: 'Image',
                    ),
                    initialValue: _initValues['imageUrl'],
                    validator: (value) => _validateItemRequired(value),
                    onSaved: (value) => _editedRecipe = Recipe(
                      id: _editedRecipe.id,
                      title: value,
                      author: _editedRecipe.author,
                      imageUrl: value,
                      description: _editedRecipe.description,
                      time: _editedRecipe.time,
                      ingredients: ingrid,
                      steps: _editedRecipe.steps,
                    ),
                  ),
                  
                   TextFormField(
                    decoration: InputDecoration(
                      hintText: 'Oat Soup',
                      labelText: 'Description',
                    ),
                    initialValue: _initValues['description'],
                    validator: (value) => _validateItemRequired(value),
                    onSaved: (value) => _editedRecipe = Recipe(
                      id: _editedRecipe.id,
                      title: value,
                      author: _editedRecipe.author,
                      imageUrl: _editedRecipe.imageUrl,
                      description: value,
                      time: _editedRecipe.time,
                      ingredients: ingrid,
                      steps: _editedRecipe.steps,
                    ),
                  ),
                   TextFormField(
                    decoration: InputDecoration(
                      hintText: '25',
                      labelText: 'Time',
                    ),
                    initialValue: _initValues['tine'],
                    validator: (value) => _validateItemRequired(value),
                    onSaved: (value) => _editedRecipe = Recipe(
                      id: _editedRecipe.id,
                      title: value,
                      author: _editedRecipe.author,
                      imageUrl: _editedRecipe.imageUrl,
                      description: _editedRecipe.description,
                      time:  double.parse(value),
                      ingredients: ingrid,
                      steps: mysteps,
                    ),
                  ),
                  TextFormField(
                      decoration: InputDecoration(
                        hintText: 'I add Tomatos',
                        labelText: 'Ingredients',
                      ),
                      initialValue: _initValues['ingredients'],
                      validator: (value) => _validateItemRequired(value),
                      onSaved: (value) => {
                            _editedRecipe.ingredients.add(value),
                            _editedRecipe = Recipe(
                              id: _editedRecipe.id,
                              title: _editedRecipe.title,
                              author: _editedRecipe.author,
                              imageUrl: _editedRecipe.imageUrl,
                              description: _editedRecipe.description,
                              time: _editedRecipe.time,
                              ingredients: ingrid,
                              steps: _editedRecipe.steps,
                            ),
                          }),
                     TextFormField(
                      decoration: InputDecoration(
                        hintText: 'I add Tomatos',
                        labelText: 'Steps',
                      ),
                      initialValue: _initValues['steps'],
                      validator: (value) => _validateItemRequired(value),
                      onSaved: (value) => {
                          _editedRecipe.steps.add(value),
                            _editedRecipe = Recipe(
                              id: _editedRecipe.id,
                              title: _editedRecipe.title,
                              author: _editedRecipe.author,
                              imageUrl: _editedRecipe.imageUrl,
                              description: _editedRecipe.description,
                              time: _editedRecipe.time,
                              ingredients:_editedRecipe.ingredients ,
                              steps: _editedRecipe.steps,
                            ),
                          }),
                  Divider(
                    height: 32.0,
                  ),
                  RaisedButton(
                      child: Text('Save'),
                      color: Colors.teal,
                      onPressed: () {
                        _submitOrder();
                      })
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
