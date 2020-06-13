import 'dart:ui';

import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      // appBar: AppBar(
      //   backgroundColor: Colors.red,
      //   title: Text('Profile', style: TextStyle(color: Colors.black12, fontSize: 40, fontWeight: FontWeight.bold),),
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
          Container(
            decoration: BoxDecoration(
              color: Colors.red
            ),
            height: 200,
            child: Column(
              children: <Widget>[
             Padding(
               padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40),
               child: Row(
                children: <Widget>[
                  ClipRRect(
                    borderRadius: BorderRadius.circular(30),
                    child: Image.asset('images/woman.png', height: 60,),
                    ),
                    Column(
                      children: <Widget>[
                        Padding(padding: const EdgeInsets.symmetric(horizontal: 35)),
                        Text('Name', style: TextStyle(color: Colors.white),),
                        Text('Address', style: TextStyle(color: Colors.white),),
                      ],
                    ),
                ],
            ),
             ),
             Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
               children: <Widget>[
                 //Padding(padding: EdgeInsets.symmetric(vertical: 40)),
                 Text('Followers', style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                 Text('Following', style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                 Text('Features', style:TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
               ]
             )
              ]
            )
          ),

          

        ],)
      ),
      
    );
  }
}