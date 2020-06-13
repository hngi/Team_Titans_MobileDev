import 'package:flutter/material.dart';

class Categories extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
       children: <Widget>[
         Text('Categories',
         style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 23,
         ),),
         InkWell(
           onTap: () => print('Tapped'),
           child:  WideContainer('assets/images/cooking_1.jpeg'),
         ),
         Padding(
           padding: const EdgeInsets.only(top:0.0,left:16.0),
           child: Text('Vegetables'),
         ),
          InkWell(
           onTap: () => print('Tapped'),
           child:  WideContainer('assets/images/cooking_3.jpeg'),
         ),
         Padding(
           padding: const EdgeInsets.only(top:0.0,left:16.0),
           child: Text('Herbs'),
         ),
         GridViewList('assets/images/piccata.jpg', 'assets/images/pancake.jpg',)
       ], 
      ),
    );
  }
}

class WideContainer extends StatelessWidget {
  String imageUrl;
  WideContainer(this.imageUrl);
  @override
  Widget build(BuildContext context) {
        return Container(
          margin: EdgeInsets.all(16),
          height: 160,
          width: 240,
          child: Image(
            image: AssetImage(
              imageUrl
            ),
            fit: BoxFit.cover,
          ),
    );
  }
}

class GridViewList extends StatelessWidget {
  final String imageUrl1, imageUrl2;
  GridViewList(this.imageUrl1,this.imageUrl2);
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.all(16),
          height: 120,
          width: 120,
          child: Image(
            image: AssetImage(
              imageUrl2
            ),
            fit: BoxFit.cover,
          ),
    ),
    Container(
          margin: EdgeInsets.all(16),
          height: 120,
          width: 120,
          child: Image(
            image: AssetImage(
              imageUrl1
            ),
            fit: BoxFit.cover,
          ),
    ),
      ],
    );
  }
}