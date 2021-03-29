import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:skillshark/components/db_service.dart';
import 'package:skillshark/components/models.dart';

class profilePreview extends StatelessWidget {
  profilePreview(this.radius);

  double radius;

  @override
  Widget build(BuildContext context) {
    var currentUser = FirebaseAuth.instance.currentUser;

    return StreamBuilder<Usr>(
        stream: DatabaseService().getUser(currentUser.uid),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CircleAvatar(
              radius: radius,
              child: ClipOval(
                child: Image(
                  image: NetworkImage(snapshot.data.dplink),
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
