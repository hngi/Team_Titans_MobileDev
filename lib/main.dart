import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
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
    Future getCurrentUser() async {
      FirebaseUser _user = await FirebaseAuth.instance.currentUser();
      print("User: ${_user.displayName ?? "None"}");
      return _user;
    }
    // >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>
    // Use this to login user directly
// >>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

//  MyAppClient().getCurrentUser() != null
//       ? HomeViewController()
//       : LoginViewController(),

    return ChangeNotifierProvider(
      builder: (ctx) => Recipes(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        debugShowCheckedModeBanner: false,
        initialRoute: '/',
        routes: {
          '/': (ctx) => SplashScreen(),
          CreateEditRecipe.routeName: (ctx) => CreateEditRecipe(),
          ViewRecipe.routeName: (ctx) => ViewRecipe(),
        },
      ),
    );
  }
}
