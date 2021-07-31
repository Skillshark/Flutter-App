import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skillshark/components/db_service.dart';
import 'package:skillshark/components/models.dart';
import 'package:skillshark/pages/profile.dart';
import 'package:skillshark/profile/profile.dart';

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
            return InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Profile(
                      userid: userid,
                    ),
                  ),
                );
              },
              child: CircleAvatar(
                radius: radius,
                child: Container(
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: NetworkImage(
                        snapshot.data.dplink == ''
                            ? 'https://firebasestorage.googleapis.com/v0/b/skillshare-69b1f.appspot.com/o/defaults%2Fdefalt.jpg?alt=media&token=b8edcc95-2606-49a2-ab02-caae996b3aa9'
                            : snapshot.data.dplink.toString(),
                      ),
                      fit: BoxFit.contain,
                    ),
                  ),
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
