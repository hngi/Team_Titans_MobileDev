import 'package:flutter/material.dart';
import 'package:recipe/utils/utils.dart';
import 'package:recipe/widget/custom_app_bar.dart';


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
    "Salt",
    "Rice",
    "Tomatoes",
    "Salt",
    "Rice",
    "Tomatoes",
    "Salt",
    "Rice",
    "Tomatoes",
    "Salt",
    "Rice",
    "Tomatoes",
  ],
  "likes": "1546",
  "readingTime": "1hr 20 Min",
  "steps": {
    "1": """Blend the tomatoes, onions and tatashe to a smooth paste.
     Heat it in a pot to reduce the volume of water, do this till you dots on the pepper"""
  }
};

class RecipeDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: details["recipeName"] as String,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.more_vert, color: Colors.white),
            onPressed: (){}
          )
        ]
      ),
      body: ListView(
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
                      fit: BoxFit.cover
                    )
                  ),
                ),
                Container(
                  height: getScreenHeight(context) * 0.35,
                  width: getScreenWidth(context),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.47)
                  ),
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
                      color: Colors.black.withOpacity(0.36)
                    ),
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
                      image: AssetImage("assets/images/details_page_background_photo.png"),
                      fit: BoxFit.cover
                    )
                  ),
                ),
                Container(
                 height: getScreenHeight(context) * 0.65,
                  width: getScreenWidth(context),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.89)
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: getScreenWidth(context) * 0.07, vertical: 20),
                  child: Column(
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              IconButton(
                                icon: Icon(Icons.favorite_border, color: Theme.of(context).primaryColor,),
                                onPressed: (){}
                              ),
                              Text(
                                details["likes"].toString() + " likes",
                                 style: Theme.of(context).textTheme.bodyText1

                              )
                            ],
                          ),
                          FlatButton(
                            color: Colors.transparent,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: BorderSide(
                                width: 1,
                                color: Colors.white
                              )
                            ),
                            onPressed: (){},
                            child: Text(
                              "Save",
                              style: Theme.of(context).textTheme.bodyText1
                            )
                          )

                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            
          )
        ],
      ),
    );
  }
}