import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:recipe/const/colors.dart';
import 'package:recipe/const/widget.dart';
import 'package:recipe/screens/sigin_in.dart';

class For extends StatefulWidget {
  @override
  _ForState createState() => _ForState();
}

class _ForState extends State<For> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  bool isLoading = false;
  GlobalKey<FormState> _formKey = new GlobalKey<FormState>();
  TextEditingController _userEmail = new TextEditingController();

  Future<void> resetPassword(String email) async {
     setState(() {
        isLoading = true;
      });
    await _firebaseAuth.sendPasswordResetEmail(email: email);
     setState(() {
        isLoading = false;
      });
          showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text("Email Reset"),
              content: Text("Check your email and create a new password"),
              actions: [
                FlatButton(
                  child: Text("Ok"),
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SignIn()));
                  },
                )
              ],
            );
          });

}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      resizeToAvoidBottomPadding: false,
      body: Container(
        height:MediaQuery.of(context).size.height,
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
                      "Enter your email to reset your password",
                      style: TextStyle(
                          color: authTextColor,
                          fontFamily: 'Source_Sans_Pro',
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.normal,
                          fontSize: 30),
                    ),
                  ),
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
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 40),
                  InkWell(
                      onTap: () {
                        if (_formKey.currentState.validate()) {
                          resetPassword(_userEmail.text);
                        }
                      },
                      child: isLoading == true
                          ? CircularProgressIndicator()
                          : btnButton("Reset Passowrd")),
                ],
              ),
            ),
          )),
    );
  }
}
