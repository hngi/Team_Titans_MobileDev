import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:recipe/pages/profile_page.dart';
import 'package:recipe/screens/home_page.dart';
import 'package:recipe/screens/sigin_in.dart';
import 'localGrid.dart';
import 'searchbar.dart';
import 'recipegridview.dart';

class Home extends StatefulWidget {
  final String uid;

  const Home({Key key, this.uid}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  _signOut() async {
    await _firebaseAuth.signOut();
    Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context) => SignIn()));
  }

  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    List<dynamic> tab = [
      HomePage(uid: widget.uid),
      ListGridView(),
      LocalListGridView(),
      LocalListGridView(),
    ];

    return Scaffold(
      body: SafeArea(
        child: tab[currentIndex],
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: currentIndex,
        showElevation: true,
        itemCornerRadius: 8,
        curve: Curves.easeInBack,
        onItemSelected: (index) => setState(() {
          currentIndex = index;
          if (currentIndex == 3) {
            _signOut();
          }
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Home', style: TextStyle(fontFamily: 'Source_Sans_Pro'),),
            inactiveColor: Colors.grey,
            activeColor: Colors.green,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.fastfood),
            title: Text('Continental Recipes', style: TextStyle(fontFamily: 'Source_Sans_Pro'),),
            inactiveColor: Colors.grey,
            activeColor: Colors.green,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.fastfood),
            title: Text(
              'Local Recipes ', style: TextStyle(fontFamily: 'Source_Sans_Pro'),
            ),
            inactiveColor: Colors.grey,
            activeColor: Colors.green,
            textAlign: TextAlign.center,
          ),
          BottomNavyBarItem(
            icon: Icon(Icons.offline_pin),
            title: Text('Log out', style: TextStyle(fontFamily: 'Source_Sans_Pro'),),
            activeColor: Colors.red,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
