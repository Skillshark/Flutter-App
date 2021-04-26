import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skillshark/components/db_service.dart';
import 'package:skillshark/components/models.dart';

class profilePreview extends StatelessWidget {
  profilePreview(this.radius, this.userid);

  double radius;
  String userid;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Usr>(
        stream: DatabaseService().getUser(userid),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CircleAvatar(
              radius: radius,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: NetworkImage(snapshot.data.dplink),
                      fit: BoxFit.contain),
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }
}
