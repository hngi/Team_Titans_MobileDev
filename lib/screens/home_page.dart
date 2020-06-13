import 'package:carousel_pro/carousel_pro.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:getflutter/components/search_bar/gf_search_bar.dart';
import 'package:recipe/const/colors.dart';
import 'package:recipe/pages/detail.dart';
import 'package:lottie/lottie.dart';
import 'package:recipe/provider/recipes.dart';
import 'package:recipe/utils/data.dart';
import 'package:recipe/utils/local.dart';

class HomePage extends StatefulWidget {
  final String uid;

  const HomePage({Key key, this.uid}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List uid = [];
 
  Future<String> getCurrentUser() async {
      FirebaseUser _user = await FirebaseAuth.instance.currentUser();
      print("User: ${_user.uid ?? "None"}");
      uid.add(_user.uid);
      return _user.uid;
    }

  String greeting() {
    var hour = DateTime.now().hour;
    if (hour < 12) {
      return 'Good Morning ,';
    }
    if (hour < 17) {
      return 'Good Afternoon,';
    }
    return 'Good Evening,';
  }

  List list = ['local', 'Continental'];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light.copyWith(
        statusBarColor: Colors
            .white70 //Color.fromRGBO(39, 32, 48, 1.0), //or set color with: Color(0xFF0000FF)
        ));
    return Scaffold(
        body: SingleChildScrollView(
          child: StreamBuilder(
            stream: Firestore.instance
                  .collection('users')
                  .document('${widget.uid}')
                  .snapshots(),
            builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
            return Container(
              margin: EdgeInsets.symmetric(horizontal: 8.0),
              child: Column(
                children: <Widget>[
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      "${greeting()}",
                      style: TextStyle(
                        color: Colors.black26,
                        fontFamily: 'Source_Sans_Pro',
                        fontWeight: FontWeight.w500,
                        fontSize: 24,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(right: 10.0),
                      child: Container(
                          child: Lottie.asset(
                              "assets/images/20540-user-profile.json",
                              height: 50,
                              width: 50)),
                    ),
                  ],
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: snapshot.hasData ? Text("${snapshot.data['name'].toString()}",
                      style: TextStyle(
                          color: Colors.green,
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Source_Sans_Pro')) : Text(""),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      "What will you like to cook today ?",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                          fontFamily: 'Source_Sans_Pro'),
                    )),
                SizedBox(
                  height: 20,
                ),
                GFSearchBar(
                  searchList: list,
                  searchQueryBuilder: (query, list) {
                    return list
                        .where((item) =>
                            item.toLowerCase().contains(query.toLowerCase()))
                        .toList();
                  },
                  overlaySearchListItemBuilder: (item) {
                    return Container(
                      padding: const EdgeInsets.all(8),
                      child: Text(item,
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 24,
                              fontFamily: 'Source_Sans_Pro')),
                    );
                  },
                  onItemSelected: (item) {
                  if(item == list[0]){
                    
                  }else{
                    print("me");
                  }
                  },
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Local Recipes",
                    style: TextStyle(
                        color: Colors.black87.withOpacity(0.8),
                        fontFamily: 'Source_Sans_Pro',
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 200,
                  child: ListView.builder(
                      itemCount: 5,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailsPage(
                                          recipe: null,
                                          localrecipe: Local.localrecipes[index],
                                        )));
                          },
                          child: UserlistTile(
                            imgAssetPath: Local.localrecipes[index].imageUrl,
                            speciality: Local.localrecipes[index].title,
                            noOfDoctors: Local.localrecipes[index].time,
                            backColor: Local.localrecipes[index].color,
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: const EdgeInsets.only(right: 10.0),
                  child: Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    height: 120,
                    decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [Color(0xffB7A8C4), Color(0xff3C44C8)]),
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        SizedBox(
                          width: 5,
                        ),
                        Container(
                            height: 100,
                            width: 100,
                            child: ClipOval(
                              child: Image.network(
                                'https://images.unsplash.com/photo-1506354666786-959d6d497f1a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80',
                                height: 120,
                                fit: BoxFit.fitHeight,
                              ),
                            )),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              width: 220,
                              child: Text(
                                "“One cannot think well, love well, sleep well, if one has not dined well.” ",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Source_Sans_Pro',
                                    fontWeight: FontWeight.bold),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Continental Recipes",
                    style: TextStyle(
                        color: Colors.black87.withOpacity(0.8),
                        fontFamily: 'Source_Sans_Pro',
                        fontSize: 20,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  height: 250,
                  child: ListView.builder(
                      itemCount: Data.recipes.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => DetailsPage(
                                          recipe: Data.recipes[index],
                                        )));
                          },
                          child: SpecialistTile(
                            imgAssetPath: Data.recipes[index].imageUrl,
                            speciality: Data.recipes[index].title,
                            noOfDoctors: Data.recipes[index].time,
                            backColor: Data.recipes[index].color,
                          ),
                        );
                      }),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          );
        }
      ),
    ));
  }
}

class SpecialistTile extends StatelessWidget {
  final String imgAssetPath;
  final String speciality;
  final String noOfDoctors;
  final Color backColor;

  SpecialistTile(
      {@required this.imgAssetPath,
      @required this.speciality,
      @required this.backColor,
      this.noOfDoctors});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          color: backColor, borderRadius: BorderRadius.circular(24)),
      padding: EdgeInsets.only(top: 16, right: 16, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            speciality,
            style: TextStyle(color: Colors.white, fontFamily: 'Source_Sans_Pro', fontSize: 20),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            "$noOfDoctors Minutes",
            style: TextStyle(color: Colors.white, fontFamily: 'Source_Sans_Pro', fontSize: 13),
          ),
          SizedBox(
            height: 6,
          ),
          ClipOval(
            child: Image.network(
              imgAssetPath,
              height: 120,
              fit: BoxFit.fitHeight,
            ),
          )
        ],
      ),
    );
  }
}

class UserlistTile extends StatelessWidget {
  final String imgAssetPath;
  final String speciality;
  final String noOfDoctors;
  final Color backColor;

  UserlistTile(
      {@required this.imgAssetPath,
      @required this.speciality,
      @required this.backColor,
      this.noOfDoctors});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      margin: EdgeInsets.only(right: 16),
      decoration: BoxDecoration(
          color: backColor, borderRadius: BorderRadius.circular(15)),
      padding: EdgeInsets.only(top: 16, right: 16, left: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            speciality,
            style: TextStyle(color: Colors.white, fontFamily: 'Source_Sans_Pro', fontWeight:FontWeight.normal, fontSize: 20),
          ),
          SizedBox(
            height: 6,
          ),
          ClipOval(
            child: Image.asset(
              imgAssetPath,
              height: 130,
              fit: BoxFit.fitHeight,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            "$noOfDoctors Minutes",
            style: TextStyle(color: Colors.white, fontFamily: 'Source_Sans_Pro', fontSize: 13),
          ),
        ],
      ),
    );
  }
}
