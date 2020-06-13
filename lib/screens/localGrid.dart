import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:recipe/pages/detail.dart';
import 'package:recipe/utils/data.dart';
import 'package:recipe/utils/local.dart';

class LocalListGridView extends StatefulWidget {
  @override
  _LocalListGridViewState createState() => _LocalListGridViewState();
}

class _LocalListGridViewState extends State<LocalListGridView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: new Padding(
          padding: const EdgeInsets.all(4.0),
          child: new StaggeredGridView.countBuilder(
            crossAxisCount: 4,

            itemCount: Local.localrecipes.length,
            itemBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsets.all(1.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsPage(
                                localrecipe: Local.localrecipes[index],
                              )));
                },
                child: Expanded(
                  child: Container(
                    child: Column(
                      children: <Widget>[
                        Container(
                          height: 200,
                          width: 160,
                          decoration: BoxDecoration(
                              color: Local.localrecipes[index].color,
                              image: DecorationImage(
                                  image: AssetImage(
                                      "${Local.localrecipes[index].imageUrl}"),
                                  fit: BoxFit.cover),
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10.0))),
                        ),
                        Column(
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.only(left: 10.0),
                              child: Container(
                                  alignment: Alignment.centerLeft,
                                  child: Text("${Local.localrecipes[index].title}",
                                      style: TextStyle(
                                          fontSize: 18,
                                          fontFamily: 'Source_Sans_Pro',
                                          fontWeight: FontWeight.w500,
                                          color: Colors.grey[800]))),
                            ),
                            Container(
                              padding: const EdgeInsets.only(left:10.0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    child: Icon(Icons.access_alarm, size: 20.0, color: Colors.grey[800]),
                                  ),
                                  Padding(
                                    padding:
                                    const EdgeInsets.only(left: 3.0),
                                    child: Container(
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        "${Local.localrecipes[index].time}mins",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: 'Source_Sans_Pro',
                                          fontWeight: FontWeight.normal,
                                          color: Colors.grey[800],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            staggeredTileBuilder: (int index) =>
                new StaggeredTile.count(2, index.isEven ? 4 : 3),
            mainAxisSpacing: 1.0,

            crossAxisSpacing: 1.0,
          ),
        ),
      ),
    );
  }
}
