import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:recipe/const/colors.dart';
import 'package:recipe/const/widget.dart';
import 'package:recipe/screens/home_page.dart';
import 'package:recipe/screens/sigin_in.dart';
import 'package:recipe/screens/sign_up.dart';

import 'btnNav.dart';
import 'forgetpassword.dart';

class SignIn extends StatefulWidget {
  static const routeName = "signIn";
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool isLoading = false;
  double inputSize = 50;
  bool obscure = true;
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  TextEditingController _userEmail = new TextEditingController();
  TextEditingController _userPassword = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: Container(
        decoration: BoxDecoration(
            color: authBackgroudColor,
            image: DecorationImage(
                image: AssetImage('assets/images/sigin.png'),
                fit: BoxFit.cover,
                colorFilter:
                    ColorFilter.mode(authBackgroudColor, BlendMode.srcATop))),
        child: Padding(
          padding: const EdgeInsets.only(top: 60.0),
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    child: Text(
                      "T-Chef",
                      style: TextStyle(
                          fontFamily: "Sacramento",
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal,
                          color: Colors.white,
                          fontSize: 45,
                          letterSpacing: 0.005),
                    ),
                  ),
                  SizedBox(height: 5),
                  Container(
                      child: Text(
                    "Welcome!",
                    style: TextStyle(
                        color: authTextColor,
                        fontFamily: 'Source_Sans_Pro',
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.normal,
                        fontSize: 43),
                  )),
                  Container(
                      child: Text("It is time to sign in and cook",
                          style: TextStyle(
                              color: authTextColor,
                              fontFamily: 'Source_Sans_Pro',
                              fontStyle: FontStyle.normal,
                              fontWeight: FontWeight.normal,
                              fontSize: 15))),
                  SizedBox(height: 20),
                  Form(
                    key: _formKey,
                    child: Theme(
                      data: ThemeData(
                          primaryColor: authTextColor,
                          primaryColorDark: authTextColor),
                      child: Column(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.all(8.0)),
                          btnDesign(_userEmail, "Email"),
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              obscureText: obscure,
                              style:
                                  TextStyle(color: Colors.white, fontFamily: 'Source_Sans_Pro', fontSize: 15),
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: obscure == false
                                      ? Icon(
                                          Icons.remove_red_eye,
                                        )
                                      : Icon(
                                          Icons.visibility_off,
                                        ),
                                  onPressed: () {
                                    setState(() {
                                      if (obscure == true) {
                                        obscure = false;
                                      } else {
                                        obscure = true;
                                      }
                                    });
                                  },
                                ),
                                labelStyle: TextStyle(
                                    color: Colors.white, fontFamily: 'Source_Sans_Pro', fontSize: 15),
                                focusColor: authTextColor,
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: authTextColor, width: 0.0),
                                ),
                                border: OutlineInputBorder(
                                  // gapPadding: 10.0,
                                  borderSide: const BorderSide(
                                      color: authTextColor, width: 0.0),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                labelText: "Password",
                              ),
                              controller: _userPassword,
                              validator: (value) {
                                if (value.isEmpty) {
                                  setState(() {
                                    inputSize = 100;
                                  });
                                  return "Your Password cannot be empty";
                                } else {
                                  return null;
                                }
                              },
                              keyboardType: TextInputType.text,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      // logInToFb();

                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (context) => For()));
                    },
                    child: Container(
                        child: Text("Forget Password?",
                            style: TextStyle(
                                color: authTextColor,
                                fontFamily: 'Source_Sans_Pro',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                fontSize: 15))),
                  ),
                  SizedBox(height: 40),
                  InkWell(
                      onTap: () {
                        if (_formKey.currentState.validate()) {
                          logInToFb();

                        }
                      },
                      child: isLoading == true
                          ? CircularProgressIndicator()
                          : btnButton("Sign In"),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => SignUp()));
                    },
                    child: Text.rich(TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(color: Colors.white, fontFamily: 'Source_Sans_Pro', fontSize: 15),
                        children: <TextSpan>[
                          TextSpan(
                              text: " Create new account",
                              style:
                                  TextStyle(color: authTextColor, fontFamily: 'Source_Sans_Pro', fontSize: 15))
                        ])),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void logInToFb() {
    setState(() {
      isLoading = true;
    });
    firebaseAuth
        .signInWithEmailAndPassword(
            email: _userEmail.text, password: _userPassword.text)
        .then((result) {
      setState(() {
        isLoading = false;
      });
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => Home(uid: result.user.uid)),
      );
    }).catchError((err) {
      setState(() {
        isLoading = false;
      });
      print(err.message);
      showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Error"),
              content: Text(err.message),
              actions: [
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ],
            );
          });
    });
  }
}
