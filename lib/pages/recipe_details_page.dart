import 'package:flutter/material.dart';
import 'package:recipe/utils/utils.dart';
import 'package:recipe/widget/custom_app_bar.dart';
import 'package:recipe/widget/margin.dart';
import 'package:recipe/widget/recipe_steps_number.dart';
import 'package:recipe/widget/yellow_underline.dart';
import 'dart:math' as math;

// This should come from an API or be passed from the previous route
const Map<String, dynamic> details = {
  "recipeName": "Jollof Rice",
  "picture": "",
  "backgroundPhoto": "",
  "ingredients": [
    "Salt",
    "Rice",
    "Tomatoes",
    "Salt",
    "Rice",
    "Tomatoes",
    "Tatashe",
    "Salt",
    "Rice",
    "Tomatoes",
    "Salt",
    "Rice",
    "White pepper",
    "Ginger",
  ],
  "likes": "1546",
  "readingTime": "1hr 20 Min",
  "steps": {
    "1":
        "Blend the tomatoes, onions and tatashe to a smooth paste. Heat it in a pot to reduce the volume of water, do this till you dots on the pepper",
    "2":
        "Blend the tomatoes, onions and tatashe to a smooth paste. Heat it in a pot to reduce the volume of water, do this till you dots on the pepper",
    "3":
        "Blend the tomatoes, onions and tatashe to a smooth paste. Heat it in a pot to reduce the volume of water, do this till you dots on the pepper",
    "4":
        "Blend the tomatoes, onions and tatashe to a smooth paste. Heat it in a pot to reduce the volume of water, do this till you dots on the pepper"
  },
  "stepsCount": 1
};

List<List<dynamic>> splitList(List<dynamic> list) {
  List<List<dynamic>> result = [];
  int halfLength = (list.length * 0.5).floor();
  result.add([...list.take(halfLength).toList()]);
  result.add([...list.skip(list.length - halfLength)]);
  return result;
}

class RecipeDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    print(splitList(details["ingredients"]));
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: true,
      resizeToAvoidBottomPadding: true,
      appBar: CustomAppBar(
          title: details["recipeName"] as String,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.more_vert, color: Colors.white),
                onPressed: () {})
          ]),
      body: SingleChildScrollView(
        child: Stack(
          children: <Widget>[
            Column(
              children: <Widget>[
                Container(
                  height: getScreenHeight(context) * 0.35,
                  //color: Colors.green,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: getScreenHeight(context) * 0.35,
                        width: getScreenWidth(context),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image:
                                    AssetImage("assets/images/jollof_rice.png"),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        height: getScreenHeight(context) * 0.35,
                        width: getScreenWidth(context),
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.47)),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          height: 70,
                          width: getScreenWidth(context),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Read in " + details["readingTime"].toString(),
                                style: Theme.of(context).textTheme.bodyText1,
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: Colors.black.withOpacity(0.36)),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  height: getScreenHeight(context) * 0.65,
                  child: Stack(
                    children: <Widget>[
                      Container(
                        height: getScreenHeight(context) * 0.65,
                        width: getScreenWidth(context),
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/details_page_background_photo.png"),
                                fit: BoxFit.cover)),
                      ),
                      Container(
                        height: getScreenHeight(context) * 0.65,
                        width: getScreenWidth(context),
                        decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.89)),
                      ),
                      Positioned(
                        bottom: 0,
                        child: Container(
                          height: 100,
                          width: getScreenWidth(context),
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [Colors.transparent, Colors.black]),
                          ),
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.only(
                left: (getScreenWidth(context) * 0.07) / 2,
                right: (getScreenWidth(context) * 0.07) / 2,
              ),
              child: Column(
                children: <Widget>[
                  Container(
                    height: getScreenHeight(context) * 0.35,
                    width: getScreenWidth(context),
                  ),
                  YMargin(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          IconButton(
                              icon: Icon(
                                Icons.favorite_border,
                                color: Theme.of(context).primaryColor,
                              ),
                              onPressed: () {}),
                          Text(details["likes"].toString() + " likes",
                              style: Theme.of(context).textTheme.bodyText1)
                        ],
                      ),
                      FlatButton(
                          color: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(width: 1, color: Colors.white)),
                          onPressed: () {},
                          child: Text("Save",
                              style: Theme.of(context).textTheme.bodyText1))
                    ],
                  ),
                  YMargin(40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextWithYellowUnderline(
                        "INGREDIENTS",
                        style: Theme.of(context).textTheme.headline2.copyWith(
                              fontWeight: FontWeight.normal,
                            ),
                      )
                    ],
                  ),
                  YMargin(20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children:
                        splitList(details["ingredients"] as List).map((e) {
                      return (Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: e
                            .map((child) => Container(
                                  margin:
                                      EdgeInsets.only(bottom: 15),
                                  child: Row(
                                    children: <Widget>[
                                      Container(
                                        height: 5,
                                        width: 5,
                                        margin:
                                            const EdgeInsets.only(right: 10),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                      ),
                                      Text(
                                        child.toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText1
                                            .copyWith(),
                                      ),
                                    ],
                                  ),
                                ))
                            .toList(),
                      ));
                    }).toList(),
                  ),
                  YMargin(40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      TextWithYellowUnderline(
                        "Directions",
                        style: Theme.of(context).textTheme.headline2.copyWith(
                              fontWeight: FontWeight.normal,
                            ),
                      )
                    ],
                  ),
                  YMargin(30),
                  Column(
                    children: (details["steps"] as Map<dynamic, dynamic>)
                        .keys
                        .map((key) => Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: <Widget>[
                                RecipeStep(key),
                                XMargin(20),
                                Flexible(
                                  child: Text(
                                    details["steps"][key].toString(),
                                    style:
                                        Theme.of(context).textTheme.bodyText1,
                                  ),
                                )
                              ],
                            ))
                        .toList(),
                  ),
                  YMargin(30)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

