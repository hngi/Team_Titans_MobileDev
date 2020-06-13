import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:recipe/const/colors.dart';
import 'package:recipe/pages/detail.dart';
import 'package:recipe/utils/data.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Container(
        child: Column(
          children: <Widget>[
            SizedBox(
                height: 200.0,
                width: double.infinity,
                child: Carousel(
                  images: [
                    NetworkImage(
                        'https://images.unsplash.com/photo-1498837167922-ddd27525d352?ixlib=rb-1.2.1&w=1000&q=80'),
                    NetworkImage(
                        'https://health.clevelandclinic.org/wp-content/uploads/sites/3/2019/06/cropped-GettyImages-643764514.jpg'),
                         NetworkImage(
                        'https://i0.wp.com/images-prod.healthline.com/hlcmsresource/images/AN_images/healthy-eating-ingredients-1296x728-header.jpg?w=1155&h=1528'),
               
                  ],
                )),
            SizedBox(
              height: 30,
            ),
            Container(
              alignment: Alignment.topLeft,
              child: Text(
                "Popular Recipes",
                style: TextStyle(
                    color: Colors.black87.withOpacity(0.8),
                    fontSize: 20,
                    fontWeight: FontWeight.w600),
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
            Padding(
              padding: const EdgeInsets.only(left: 10.0, right: 10.0),
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
                          width: 200,
                          child: Text("T - Chef",
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold)),
                        ),
                        Container(
                          width: 220,
                          child: Text(
                            "“One cannot think well, love well, sleep well, if one has not dined well.” ",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
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
            style: TextStyle(color: Colors.white, fontSize: 20),
          ),
          SizedBox(
            height: 6,
          ),
          Text(
            "$noOfDoctors Minutes",
            style: TextStyle(color: Colors.white, fontSize: 13),
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
