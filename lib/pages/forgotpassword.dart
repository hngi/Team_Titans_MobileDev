import 'package:flutter/material.dart';


class ForgotPasswordScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        children: <Widget>[
          Container(
            decoration: new BoxDecoration(
              image: new DecorationImage(
                  image: AssetImage('assets/images/food2.jpg'),
                  fit: BoxFit.fill
              ),
            ),
          ),
          Opacity(
            opacity: 0.8,
            child: Container(
              decoration: new BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topRight,
                  end: Alignment.bottomLeft,
                  colors: [Colors.black, Colors.black87],
                ),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Forgot password', style: TextStyle(
                  fontSize: 20.0,
                  letterSpacing: 2.0,
                  color: Colors.orangeAccent,
                  fontStyle: FontStyle.normal,
                ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: 35.0, vertical: 30.0),
                  child: TextField(
                    style: TextStyle(
                      color: Colors.white,
                    ),
                    decoration: InputDecoration(
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orangeAccent),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orangeAccent),
                        ),

                        hintText: 'Email',
                        hintStyle: TextStyle(color: Colors.white),
                        contentPadding: EdgeInsets.all(15.0),
//                        prefixIcon: Icon(Icons.person, color: Colors.white,)
                    ),
                    keyboardType: TextInputType.emailAddress,
                  ),
                ),
//                Padding(
//                  padding: EdgeInsets.symmetric(
//                      horizontal: 35.0, vertical: 15.0),
//                  child: TextField(
//                    style: TextStyle(
//                      color: Colors.white,
//                    ),
//                    decoration: InputDecoration(
////                        filled: true,
////                        fillColor: Colors.white,
////                        border: InputBorder.none,
//                        enabledBorder: UnderlineInputBorder(
//                          borderSide: BorderSide(color: Colors.orangeAccent),
//                        ),
//                        focusedBorder: UnderlineInputBorder(
//                          borderSide: BorderSide(color: Colors.orangeAccent),
//                        ),
//                        hintText: 'Password',
//                      hintStyle: TextStyle(color: Colors.white),
//                        contentPadding: EdgeInsets.all(15.0),
//                        prefixIcon: Icon(Icons.lock, color: Colors.white,),
//
//                    ),
//                    obscureText: true,
//                  ),
//                ),
//
//                  Padding(
//                  padding: EdgeInsets.symmetric(
//    horizontal: 35.0, vertical: 15.0),
//    child: RaisedButton(
//              onPressed: () {},
//      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
//              color: Colors.orangeAccent,
//              textColor: Colors.white,
//              child: Text(
//                "Login to continue", style: TextStyle(fontSize: 16.0),),
//              padding: EdgeInsets.symmetric(
//                  vertical: 12.0, horizontal: 80.0),
//              elevation: 0.0,
//    )
//            ),


      Opacity(
          opacity: 0.6,
    child: Padding(
    padding: EdgeInsets.symmetric(
    horizontal: 35.0, vertical: 15.0),
    child: RaisedButton(
                  onPressed: () {},
      shape: RoundedRectangleBorder(borderRadius: new BorderRadius.circular(10.0)),
                  color: Colors.orangeAccent,
                  textColor: Colors.white,
                  child: Text(
                    "Send Email", style: TextStyle(fontSize: 16.0),),
                  padding: EdgeInsets.symmetric(
                      vertical: 14.0, horizontal: 80.0),
                  elevation: 0.0,
                   )
                ),
      ),
//
//                Text("Don't have an account? SIGNUP",
//                  style: TextStyle(color: Colors.white),),
//                SizedBox(
//                  height: 30.0,
//                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
