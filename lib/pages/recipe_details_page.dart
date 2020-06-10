import 'package:flutter/material.dart';
import 'package:recipe/utils/utils.dart';
import 'package:recipe/widget/custom_app_bar.dart';
import 'package:recipe/widget/margin.dart';
import 'package:recipe/widget/recipe_steps_number.dart';
import 'package:recipe/widget/yellow_underline.dart';

// This should come from an API
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
    "Tomatoes",
    "Tatashe",
  ],
  "likes": "1546",
  "readingTime": "1hr 20 Min",
  "steps": {
    "1":
        "Blend the tomatoes, onions and tatashe to a smooth paste. Heat it in a pot to reduce the volume of water, do this till you dots on the pepper"
  },
  "stepsCount": 1
};

List<List<dynamic>> splitList(List<dynamic> list) {
  List<List<dynamic>> result = [];
  for (int i = 0; i < list.length; i = i + 2) {
    if (i + 1 <= list.length - 1) {
      result.add([list[i], list[i + 1]]);
    } else {
      result.add([list[i]]);
    }
  }
  return result;
}

class RecipeDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
          title: details["recipeName"] as String,
          actions: <Widget>[
            IconButton(
                icon: Icon(Icons.more_vert, color: Colors.white),
                onPressed: () {})
          ]),
      body: SingleChildScrollView(
        child: Column(
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
                            image: AssetImage("assets/images/jollof_rice.png"),
                            fit: BoxFit.cover)),
                  ),
                  Container(
                    height: getScreenHeight(context) * 0.35,
                    width: getScreenWidth(context),
                    decoration:
                        BoxDecoration(color: Colors.black.withOpacity(0.47)),
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
                      decoration:
                          BoxDecoration(color: Colors.black.withOpacity(0.36)),
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
                    decoration:
                        BoxDecoration(color: Colors.black.withOpacity(0.89)),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: getScreenWidth(context) * 0.07,
                        vertical: 20),
                    child: ListView(
                      children: <Widget>[
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
                                    style:
                                        Theme.of(context).textTheme.bodyText1)
                              ],
                            ),
                            FlatButton(
                                color: Colors.transparent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(
                                        width: 1, color: Colors.white)),
                                onPressed: () {},
                                child: Text("Save",
                                    style:
                                        Theme.of(context).textTheme.bodyText1))
                          ],
                        ),
                        YMargin(40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextWithYellowUnderline(
                              "INGREDIENTS",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  .copyWith(
                                    fontWeight: FontWeight.normal,
                                  ),
                            )
                          ],
                        ),
                        YMargin(20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          
                          children: splitList(details["ingredients"] as List)
                              .map<Widget>((e) => Container(
                                    margin: const EdgeInsets.only(bottom: 10),
                                    width: double.infinity,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: e
                                          .map<Widget>((child) => Expanded(
                                                child: Row(
                                                  children: <Widget>[
                                                    Container(
                                                      height: 5,
                                                      width: 5,
                                                      margin:
                                                          const EdgeInsets.only(
                                                              right: 10),
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
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
                                    ),
                                  ))
                              .toList(),
                        ),
                        YMargin(40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            TextWithYellowUnderline(
                              "Directions",
                              style: Theme.of(context)
                                  .textTheme
                                  .headline2
                                  .copyWith(
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: <Widget>[
                                      RecipeStep(key),
                                      XMargin(10),
                                      Flexible(
                                        child: Text(
                                          details["steps"][key].toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyText1,
                                        ),
                                      )
                                    ],
                                  ))
                              .toList(),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
