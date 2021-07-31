import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:skillshark/components/db_service.dart';
import 'package:skillshark/components/models.dart';
import 'package:skillshark/controller/pagecon.dart';
import 'package:skillshark/project/projectcard.dart';

Widget ptab(Size size, Pagecontrol pp, String userid) {
  return StreamBuilder<List<Post>>(
      stream: DatabaseService().streamProfilePost(userid),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return GridView.builder(
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 300,
              mainAxisSpacing: 10,
              childAspectRatio: 4 / 5,
              crossAxisSpacing: 10,
            ),
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: snapshot.data.length,
            itemBuilder: (BuildContext context, int index) {
              return Pcard(size, snapshot.data.elementAt(index).postid);
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      });
}
