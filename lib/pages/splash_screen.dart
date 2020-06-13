import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recipe/pages/create_edit_recipe.dart';
import 'package:recipe/pages/list_recipe.dart';
import 'package:recipe/screens/btnNav.dart';
import 'package:recipe/screens/sigin_in.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<FirebaseUser> getUser() async {
    return await _auth.currentUser();
  }

  @override
  void initState() {
    super.initState();
    getUser().then((user) {
      if (user != null) {
        // send the user to the home page
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.orange[400],
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(top: 40.0),
                height: 350.0,
                width: 350.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(
                        'assets/images/kisspng-chef-drawing-cooking.png'),
                    fit: BoxFit.fill,
                  ),
                  shape: BoxShape.rectangle,
                ),
              ),
              Container(
                padding: EdgeInsets.only(top: 80.0),
                child: Text(
                  'T-CHEF',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Shojumaru',
                    color: Colors.white,
                  ),
                ),
              ),
              SizedBox(height: 30.0),
              Container(
                padding: EdgeInsets.only(left: 65.0, right: 65.0),
                child: RaisedButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => SignIn()));
                  },
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                  padding: EdgeInsets.all(0.0),
                  child: Ink(
                    decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black,
                        ),
                        color: Colors.black,
                        borderRadius: BorderRadius.circular(8.0)),
                    child: Container(
                      constraints:
                          BoxConstraints(minWidth: 88.0, minHeight: 50.0),
                      alignment: Alignment.center,
                      child: Text(
                        'Get Started',
                        style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'Source_Sans_Pro',
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
