import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:skillshark/components/comment_tile.dart';
import 'package:skillshark/components/db_service.dart';
import 'package:skillshark/components/models.dart';
import 'package:skillshark/components/postdata_service.dart';
import 'package:skillshark/components/profile_preview.dart';
import 'package:skillshark/components/video_player.dart';

class vidPlayer extends StatefulWidget {
  String postid;

  vidPlayer({Key key, this.postid}) : super(key: key);
  @override
  _vidPlayerState createState() => _vidPlayerState();
}

class _vidPlayerState extends State<vidPlayer> {
  var commentController = TextEditingController();
  var searchTextController = TextEditingController();
  var currentUser = FirebaseAuth.instance.currentUser;
  bool postlike = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 5),
            height: 40,
            width: MediaQuery.of(context).size.width,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    'Skillshark',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
                Divider(
                  thickness: 10,
                  color: Colors.black,
                ),
                Container(
                  width: MediaQuery.of(context).size.width * .5,
                  child: TextField(
                    controller: searchTextController,
                    decoration: InputDecoration(
                      hintText: 'Search',
                      prefixIcon: Icon(Icons.search_outlined),
                    ),
                  ),
                ),
                Divider(
                  thickness: 10,
                  color: Colors.black,
                ),
                Container(
                  child: Row(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/post_edit');
                        },
                        child: Container(
                          height: 25,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.5),
                            border: Border.all(
                              color: Colors.black54,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Upload Video',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      IconButton(
                        icon: Icon(Icons.notifications_none_outlined),
                        onPressed: () {},
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/profile');
                        },
                        child: Container(
                          height: 30,
                          width: 30,
                          child: profilePreview(15, currentUser.uid),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          StreamBuilder<Post>(
              stream: DatabaseService().getPost(widget.postid),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var postid = snapshot.data.postid;

                  return Container(
                    height: MediaQuery.of(context).size.height - 40,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(15),
                          width: MediaQuery.of(context).size.width * .75,
                          child: ListView(
                            children: [
                              Container(
                                height: MediaQuery.of(context).size.height * .5,
                                //vidplayer
                                child:
                                    VideoApp(videoUrl: snapshot.data.videoUrl),
                              ),
                              Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Column(
                                      children: [
                                        Text(
                                          snapshot.data.title,
                                          style: TextStyle(
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          snapshot.data.timestamp
                                              .toIso8601String(),
                                          style: TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                        IconButton(
                                          onPressed: () {
                                            setState(() {
                                              postlike = !postlike;
                                            });
                                            PostdataService().postLike(postid,
                                                postlike, currentUser.uid);
                                          },
                                          icon: Icon(
                                            Icons.arrow_upward_rounded,
                                            color: postlike
                                                ? Colors.blue
                                                : Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Divider(),
                                    Container(
                                      child: StreamBuilder<Usr>(
                                          stream: DatabaseService()
                                              .getUser(snapshot.data.userid),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              return Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                children: [
                                                  profilePreview(
                                                      20, snapshot.data.uid),
                                                  SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    snapshot.data.name ?? '',
                                                    style: TextStyle(
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w500),
                                                  ),
                                                ],
                                              );
                                            } else {
                                              return Text('');
                                            }
                                          }),
                                    ),
                                    Divider(),
                                    Text(snapshot.data.bio ?? ''),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(8, 8, 8, 25),
                          width: MediaQuery.of(context).size.width * .25,
                          height: MediaQuery.of(context).size.height,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Container(
                                child: Text(
                                  'Comments',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * .50,
                                child: StreamBuilder<List<Comment>>(
                                    stream: DatabaseService()
                                        .streamComment(snapshot.data.postid),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        if (snapshot.data.length != 0) {
                                          return ListView.builder(
                                            shrinkWrap: true,
                                            itemCount: snapshot.data.length,
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              return CommentTile(
                                                width: MediaQuery.of(context)
                                                            .size
                                                            .width *
                                                        .25 -
                                                    1,
                                                postid: postid,
                                                commentid: snapshot.data
                                                    .elementAt(index)
                                                    .commentid,
                                              );
                                            },
                                          );
                                        } else {
                                          return Text('No comments');
                                        }
                                      } else {
                                        return Center(
                                          child: CircularProgressIndicator(),
                                        );
                                      }
                                    }),
                              ),
                              Container(
                                height: 25,
                                child: TextField(
                                  selectionHeightStyle: BoxHeightStyle.max,
                                  controller: commentController,
                                  decoration: InputDecoration(
                                    hintText: 'Write your comment here',
                                    hintStyle: TextStyle(
                                      fontSize: 15,
                                      color: Colors.grey,
                                    ),
                                    labelText: 'Comment',
                                    border: OutlineInputBorder(),
                                    suffixIcon: IconButton(
                                      icon: Icon(Icons.send),
                                      onPressed: () {
                                        PostdataService().createComment(
                                            snapshot.data.postid,
                                            commentController.text,
                                            currentUser.uid);
                                        commentController..text = '';
                                      },
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              }),
        ],
      ),
    );
  }
}
