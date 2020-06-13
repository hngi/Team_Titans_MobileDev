import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    print('screen height is : $screenHeight ' );
    return Scaffold(
      backgroundColor: Colors.yellow[800],
      body: Column(
        children: <Widget>[
           Stack(
             children: <Widget>[
               Padding(
                 padding: EdgeInsets.only(top:15),
                 child: Align(
                   alignment: Alignment.topCenter,
                   child: Container(
                     height:100,
                     width: 100,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(50),
                       image: DecorationImage(
                         image: AssetImage('assets/images/guest.jpg'),
                         fit: BoxFit.cover
                         )
                     ),
                   ),
                 ),
               ),
               Positioned(
                 left: 235,
                 top: 75,
                 child: Container(
                   height: 25,
                   width: 25,
                   decoration: BoxDecoration(
                     borderRadius: BorderRadius.circular(12.5),
                     color: Colors.white
                   ),
                   child: Icon(
                     Icons.fastfood,
                     color:Colors.yellow,
                     size:14
                   ),
                 )
              ),
             ],
           ),
           Column(
             children: <Widget>[
               SizedBox(height: 20),
               Text('James Hannouile',
               style: TextStyle(
                 fontFamily: 'Montesserat',
                 color: Colors.white
               ),
               ),
                SizedBox(height: 30),
                
             ],
           ),
            Container(
              height: 422.19,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                )
              ),
              child: Column(
                children: <Widget>[
                  Text('My Recipes'),
                  Row(
                    children: <Widget>[
                      SavedItem(),
                    ],
                  ),
                   Text('Saved Recipes')
                ],
              ),
            )
        ],
      ),
    );
  }
}

class SavedItem extends StatelessWidget {
  const SavedItem({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(15),
      padding: EdgeInsets.all(7),
      height: 150,
      width: 150,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 3.0,
            spreadRadius: 3.0,
            color: Colors.grey.withOpacity(0.2)
          )
        ]
      ),
      child: Stack(
        children: <Widget>[
          Container(
            margin: EdgeInsets.all(12),
            height: 100,
            width: 140,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                     'assets/images/mug.jpg',
                ),
                  fit: BoxFit.cover
                )
            ),
          ),
          Positioned(
            top: 60.0,
            left: 100.0,
            child: Container(
              height: 25,
              width: 25,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(
                  12.5
                ),
                color: Colors.white
              ),
              child: Row(
                children: <Widget>[
                  SizedBox(width: 3.0),
                  Text(
                    '5',
                    style: TextStyle(
                      color: Colors.yellow
                    ),
                  ),
                  Icon(
                    Icons.star,
                    color:Colors.yellow,
                    size:12.0
                  )
                ],
              ),
            ),
            )
        ],
      ),
    );
  }
}