import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:recipe/pages/detail.dart';
import 'package:recipe/utils/data.dart';

class ListGridView extends StatefulWidget {
  @override
  _ListGridViewState createState() => _ListGridViewState();
}

class _ListGridViewState extends State<ListGridView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: new Padding(
          padding: const EdgeInsets.all(4.0),
          child: new StaggeredGridView.countBuilder(
            crossAxisCount: 4,
            itemCount: Data.recipes.length,
            itemBuilder: (BuildContext context, int index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsPage(
                                recipe: Data.recipes[index],
                              )));
                },
                child: Expanded(
                                  child: Container(
                    child: Container(
                      height: 110,
                      width: 160,
                      decoration: BoxDecoration(
                          color: Data.recipes[index].color,
                          image: DecorationImage(
                            image: NetworkImage("${Data.recipes[index].imageUrl}"),
                            fit: BoxFit.fitHeight
                            ),
                          borderRadius:
                              BorderRadius.all(Radius.circular(10))),
                      child: Column(
                        children: <Widget>[
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 10.0, left: 10),
                            child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text("${Data.recipes[index].time} Minutes",
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ))),
                          ),
                            // Container(
                    
                        // child: ClipOval(
                        //   child: Image.network(
                        //     'https://images.unsplash.com/photo-1506354666786-959d6d497f1a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=750&q=80',
                        //     height: 40,
                        //     fit: BoxFit.fitHeight,
                        //   ),
                        // )),
                          Padding(
                            padding:
                                const EdgeInsets.only(top: 50.0, left: 10),
                            child: Container(
                                alignment: Alignment.centerLeft,
                                child: Text("${Data.recipes[index].title}",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white))),
                          )
                        ],
                      ),
                    ),
                  ),

                ),
              ),
            ),
            
            staggeredTileBuilder: (int index) =>
                new StaggeredTile.count(2, index.isEven ? 3 : 2),
            mainAxisSpacing: 5.0,
            crossAxisSpacing: 5.0,
          ),
        ),
      ),
    );
  }
}
