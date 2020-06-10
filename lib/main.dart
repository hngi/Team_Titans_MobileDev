import 'package:flutter/material.dart';
import 'package:recipe/pages/recipe_details_page.dart';
import './pages/create_edit_recipe.dart';
import './pages/list_recipe.dart';
import 'package:provider/provider.dart';
import './pages/view_recipe.dart';
import './provider/recipes.dart';
import './pages/splash_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (ctx) => Recipes(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
         primaryColor: Color(0xffFFB119),
         fontFamily: "Source_Sans_Pro",
         textTheme: TextTheme(
           headline1: TextStyle(
             
           ),
           headline2: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 22,
           ),
           bodyText1: TextStyle(
             fontSize: 19,
             color: Colors.white
           )
         ),
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (ctx) => RecipeDetailsPage(),//SplashScreen(),
          CreateEditRecipe.routeName: (ctx) => CreateEditRecipe(),
          ViewRecipe.routeName: (ctx) => ViewRecipe(),
        },
      ),
    );
  }
}
