import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillshark/component/cart.dart';
import 'package:skillshark/component/tag.dart';
import 'package:skillshark/components/db_service.dart';
import 'package:skillshark/components/models.dart';
import 'package:skillshark/model/projectm.dart';
import 'package:skillshark/project/cartsearch.dart';
import 'package:skillshark/project/header.dart';
import 'package:skillshark/project/projectcard.dart';

class Project extends StatefulWidget {
  @override
  _ProjectState createState() => _ProjectState();
}

class _ProjectState extends State<Project> {
  Size size;
  List<String> keys = <String>[
    'New project',
    'Medium',
  ];
  List<String> plat = <String>[
    'Platform',
    'Medium',
  ];
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PHead(size),
            SizedBox(
              height: 10,
            ),
            Carts(size),
            SizedBox(
              height: 10,
            ),
            Cart(size, context),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Text(
                'Featured Projects',
                style: GoogleFonts.lato(
                    fontSize: 25,
                    color: Colors.blue[700],
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Row(
                children: [
                  Text(
                    'Sort By',
                    style: GoogleFonts.lato(
                        fontSize: 17, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  menu(context, 'New Projects'),
                  SizedBox(
                    width: 15,
                  ),
                  menu(context, 'Platforms'),
                  SizedBox(
                    width: 15,
                  ),
                  menu(context, 'Videos'),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            tag(size),
            SizedBox(
              height: 20,
            ),
            StreamBuilder<List<Post>>(
                stream: DatabaseService().streamPost(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return GridView.builder(
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300,
                        mainAxisSpacing: 10,
                        childAspectRatio: 4 / 4.5,
                        crossAxisSpacing: 10,
                      ),
                      shrinkWrap: true,
                      itemCount: snapshot.data.length,
                      physics: NeverScrollableScrollPhysics(),
                      itemBuilder: (BuildContext context, int index) {
                        return Pcard(
                            size, snapshot.data.elementAt(index).postid);
                      },
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                })
          ],
        ),
      ),
    );
  }

  Widget menu(BuildContext context, String string) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(8),
        width: size.width / 7,
        height: 35,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: Border.all(color: Colors.black)),
        child: Center(
          child: TextField(
            decoration: InputDecoration(
                fillColor: Colors.white,
                suffixIcon: Icon(Icons.keyboard_arrow_down_sharp),
                filled: true,
                border: InputBorder.none,
                hintStyle: TextStyle(fontSize: 13),
                hintText: string),
          ),
        ),
      ),
    );
  }
}
