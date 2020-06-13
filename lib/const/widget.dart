import 'package:flappy_search_bar/flappy_search_bar.dart';
import 'package:flappy_search_bar/scaled_tile.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:recipe/const/colors.dart';

Widget btnDesign(TextEditingController controllerName, String labelName) {
  double inputSize = 50;
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: TextFormField(
      decoration: InputDecoration(
        labelStyle: TextStyle(color: Colors.white, fontSize: 15),
        focusColor: authTextColor,
        enabledBorder: const OutlineInputBorder(
          borderSide: const BorderSide(color: authTextColor, width: 0.0),
        ),
        border: OutlineInputBorder(
          // gapPadding: 10.0,
          borderSide: const BorderSide(color: authTextColor, width: 0.0),
          borderRadius: BorderRadius.circular(8),
        ),
        labelText: labelName,
      ),
      controller: controllerName,
      validator: (value) {
        if (value.isEmpty) {
        inputSize = 100;
          return "Your $labelName cannot be empty";
        } else {
          return null;
        }
      },
      keyboardType: TextInputType.text,
      style: TextStyle(color: Colors.white, fontSize: 15),
    ),
  );
}

Widget btnButton(String textProvide) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Container(
      height: 50,
      alignment: Alignment.center,
      width: double.infinity,
      decoration: BoxDecoration(
        color: authTextColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(textProvide,
          style: TextStyle(color: Colors.white, fontSize: 15)),
    ),
  );
}

void showToast(message, Color color) {
  print(message);
  Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_LONG,
      gravity: ToastGravity.CENTER,
      backgroundColor: color,
      textColor: Colors.white,
      fontSize: 16.0);
}

Widget testKit(String testKitType, String url) {
  return Padding(
    padding: const EdgeInsets.only(left: 8.0, right: 8.0),
    child: Stack(
      alignment: Alignment.topRight,
      children: <Widget>[
        Container(
          height: 150,
          width: 110,
          alignment: Alignment.bottomCenter,
          decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(blurRadius: 5, color: Colors.black.withAlpha(50))
              ],
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(10),
                  bottomLeft: Radius.circular(10),
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(20))),
          child: Text("$testKitType",
              style: TextStyle(color: authTextColor, fontSize: 15)),
        ),
        Container(
          height: 100,
          width: 80,
          decoration: BoxDecoration(
              color: Colors.grey.withAlpha(100),
              image: DecorationImage(
                image: NetworkImage(url),
              ),
              borderRadius: BorderRadius.circular(10)),
        )
      ],
    ),
  );
}

class Post {
  final String title;
  final String body;

  Post(this.title, this.body);
}

Widget searchBar(_getALlPosts, _searchBarController, context, isReplay) {
  return SafeArea(
    child: SearchBar<Post>(
      searchBarPadding: EdgeInsets.symmetric(horizontal: 10),
      headerPadding: EdgeInsets.symmetric(horizontal: 10),
      listPadding: EdgeInsets.symmetric(horizontal: 10),
      onSearch: _getALlPosts,
      searchBarController: _searchBarController,
      placeHolder: Center(child: Text("Under Construction")),
      cancellationWidget: Text("Cancel"),
      emptyWidget: Text("empty"),
      indexedScaledTileBuilder: (int index) =>
          ScaledTile.count(1, index.isEven ? 2 : 1),
      onCancelled: () {
        print("Cancelled triggered");
      },
      mainAxisSpacing: 10,
      crossAxisSpacing: 10,
      crossAxisCount: 2,
      onItemFound: (Post post, int index) {
        return Container(
          color: Colors.lightBlue,
          child: ListTile(
            title: Text(post.title),
            isThreeLine: true,
            subtitle: Text(post.body),
            onTap: () {
              // Navigator.of(context).push(MaterialPageRoute(builder: (context) => Detail()));
            },
          ),
        );
      },
    ),
  );
}
