import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe/screens/btnNav.dart';
import 'package:recipe/screens/home_page.dart';
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
          title: 'T-Chef',
          theme: ThemeData(
            primarySwatch: Colors.blue,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          debugShowCheckedModeBanner: false,
          home: SplashScreen()),
    );
  }
}
