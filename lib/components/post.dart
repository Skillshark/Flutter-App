import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skillshark/components/db_service.dart';
import 'package:skillshark/components/models.dart';
import 'package:skillshark/components/profile_preview.dart';
import 'package:skillshark/pages/videoplayer_page.dart';

class post extends StatefulWidget {
  String postid;

  post({
    this.postid,
    Key key,
  }) : super(key: key);
  @override
  _postState createState() => _postState();
}

class _postState extends State<post> {
  var currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Post>(
        stream: DatabaseService().getPost(widget.postid),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: InkWell(
                onTap: () {
                  if (currentUser != null) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => vidPlayer(postid: widget.postid),
                      ),
                    );
                  } else {
                    Navigator.pushNamed(context, '/login');
                  }
                },
                child: Container(
                  width: 300,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.all(8.0),
                        height: 160,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(snapshot.data.thumbnailUrl != ''
                                ? snapshot.data.thumbnailUrl
                                : 'https://firebasestorage.googleapis.com/v0/b/skillshare-69b1f.appspot.com/o/defaults%2Fdownload.png?alt=media&token=442cd51b-fd5a-477a-aebd-8af3599ae9a9'),
                            fit: BoxFit.cover,
                          ),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(5),
                              topRight: Radius.circular(5)),
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              snapshot.data.title.toString(),
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w800,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 20,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                //add profile
                                Container(
                                  child: StreamBuilder<Usr>(
                                      stream: DatabaseService()
                                          .getUser(snapshot.data.userid),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return Row(
                                            children: [
                                              profilePreview(
                                                  8, snapshot.data.uid),
                                              SizedBox(
                                                width: 2,
                                              ),
                                              Text(
                                                snapshot.data.name,
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w900),
                                              ),
                                            ],
                                          );
                                        } else {
                                          return Text('');
                                        }
                                      }),
                                ),
                              ],
                            ),
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: [
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.thumb_up_alt_outlined,
                                        size: 12.5,
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Text(snapshot.data.upvote.toString()),
                                      SizedBox(
                                        width: 1,
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Icon(
                                        Icons.message_outlined,
                                        size: 12.5,
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      StreamBuilder<List<Comment>>(
                                          stream: DatabaseService()
                                              .streamComment(
                                                  snapshot.data.postid),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              return Text(snapshot.data.length
                                                  .toString());
                                            } else {
                                              return Text('0');
                                            }
                                          }),
                                      SizedBox(
                                        width: 3,
                                      ),
                                      Icon(
                                        Icons.bookmark_outline,
                                        size: 12.5,
                                      ),
                                      SizedBox(
                                        width: 3,
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Container(
              padding: EdgeInsets.all(8.0),
              width: 300,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(8.0),
                    height: 200,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Icon(Icons.image_not_supported),
                    ),
                  ),
                  Container(
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            //add profile
                            Container(
                              child: Text(
                                'Saswat Nayak',
                                style: TextStyle(fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.thumb_up_alt_outlined,
                                    size: 12.5,
                                  ),
                                  Text('6.6k'),
                                  SizedBox(
                                    width: 1,
                                  ),
                                  Icon(
                                    Icons.message_outlined,
                                    size: 12.5,
                                  ),
                                  Text('1.1k'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          }
        });
  }
}
