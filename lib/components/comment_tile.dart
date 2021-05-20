import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skillshark/components/db_service.dart';
import 'package:skillshark/components/models.dart';
import 'package:skillshark/components/postdata_service.dart';
import 'package:skillshark/components/profile_preview.dart';

class CommentTile extends StatefulWidget {
  String commentid;
  String postid;
  double width;

  CommentTile({Key key, this.commentid, this.postid, this.width})
      : super(key: key);

  @override
  _CommentTileState createState() => _CommentTileState();
}

class _CommentTileState extends State<CommentTile> {
  bool commentupvote = false;
  bool commentdownvote = false;
  var currentUser = FirebaseAuth.instance.currentUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: Card(
        child: Column(
          children: <Widget>[
            StreamBuilder<Comment>(
                stream: DatabaseService()
                    .getComment(widget.postid, widget.commentid),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      child: Column(
                        children: [
                          StreamBuilder<Usr>(
                              stream: DatabaseService()
                                  .getUser(snapshot.data.userid),
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(snapshot.data.name ?? ''),
                                        profilePreview(10, snapshot.data.uid),
                                      ],
                                    ),
                                  );
                                } else {
                                  return Container(
                                    child: Text('User'),
                                  );
                                }
                              }),
                          Container(
                            child: Text(snapshot.data.commentTxt),
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      commentupvote = !commentupvote;
                                    });
                                    PostdataService().commentUpvote(
                                        widget.postid,
                                        widget.commentid,
                                        commentupvote,
                                        currentUser.uid);
                                  },
                                  icon: Icon(
                                    Icons.arrow_upward_rounded,
                                    color: commentupvote
                                        ? Colors.blue
                                        : Colors.black,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      commentdownvote = !commentdownvote;
                                    });
                                    PostdataService().commentDownvote(
                                        widget.postid,
                                        widget.commentid,
                                        commentdownvote,
                                        currentUser.uid);
                                  },
                                  icon: Icon(
                                    Icons.arrow_downward_rounded,
                                    color: commentdownvote
                                        ? Colors.blue
                                        : Colors.black,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    );
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                }),
          ],
        ),
      ),
    );
  }
}
