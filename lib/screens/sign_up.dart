import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:recipe/const/colors.dart';
import 'package:recipe/const/widget.dart';
import 'package:recipe/screens/home_page.dart';
import 'package:recipe/screens/sigin_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

import 'btnNav.dart';

class SignUp extends StatefulWidget {
  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool isLoading = false;
  bool obscure = true;
  double inputSize = 50;
  FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  DatabaseReference dbRef =
      FirebaseDatabase.instance.reference().child("Users");
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();

  TextEditingController _userEmail = new TextEditingController();
  TextEditingController _userPassword = new TextEditingController();
  TextEditingController _confirmUserPassword = new TextEditingController();
  TextEditingController _userName = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: Container(
        height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              color: authBackgroudColor,
              image: DecorationImage(
                  image: AssetImage('assets/images/welcome.png'),
                  fit: BoxFit.cover,
                  colorFilter:
                      ColorFilter.mode(authBackgroudColor, BlendMode.srcATop))),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 30),
                  Container(
                    padding: EdgeInsets.only(left: 10.0),
                    alignment: Alignment.topLeft,
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          color: authTextColor,
                          fontFamily: 'Source_Sans_Pro',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal,
                          fontSize: 43),
                    ),
                  ),
                  SizedBox(height: 10),
                  Form(
                    key: _formKey,
                    child: Theme(
                      data: ThemeData(
                          primaryColor: authTextColor,
                          primaryColorDark: authTextColor),
                      child: Column(
                        children: <Widget>[
                          Padding(padding: EdgeInsets.all(8.0)),
                          btnDesign(_userName, "Username"),
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
                          Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: TextFormField(
                              obscureText: obscure,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                              decoration: InputDecoration(
                                suffixIcon: IconButton(
                                  icon: obscure == false
                                      ? Icon(Icons.remove_red_eye,
                                      )
                                      : Icon(Icons.visibility_off,
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
                                labelText: "Confirm Password",
                              ),
                              controller: _confirmUserPassword,
                              validator: (value) {
                                if (value.isEmpty) {
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
                  SizedBox(height: 40),
                  InkWell(
                      onTap: () {
                        if (_formKey.currentState.validate()) {
                          if (_userPassword.text == _confirmUserPassword.text) {
                            registerToFb();
                          }
                        }
                      },
                      child: isLoading == true
                          ? CircularProgressIndicator()
                          : btnButton("Sign Up")),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) => SignIn()));
                    },
                    child: Text.rich(TextSpan(
                        text: "Already have an account? ",
                        style: TextStyle(color: Colors.white, fontFamily: 'Source_Sans_Pro', fontSize: 15),
                        children: <TextSpan>[
                          TextSpan(
                              text: "Log In",
                              style:
                                  TextStyle(color: authTextColor, fontFamily: 'Source_Sans_Pro', fontSize: 15))
                        ])),
                  )
                ],
              ),
            ),
          )),
    );
  }

  void registerToFb() {
    setState(() {
      isLoading = true;
    });
    firebaseAuth
        .createUserWithEmailAndPassword(
            email: _userEmail.text, password: _userPassword.text)
        .then((authResult) {
      Firestore.instance.collection("users").document(authResult.user.uid).setData({
        "uid": authResult.user.uid,
        "email": _userEmail.text,
        "name": _userName.text
      }).then((result) {
        setState(() {
          isLoading = false;
        });
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => Home(uid: authResult.user.uid)),
        );
      });
    }).catchError((err) {
      setState(() {
        isLoading = false;
      });
      showToast(err.message, Colors.red);
    });
  }

  @override
  void dispose() {
    super.dispose();
    _userName.dispose();
    _userEmail.dispose();
    _userPassword.dispose();
    _confirmUserPassword.dispose();
  }
}
