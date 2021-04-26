import 'package:flutter/material.dart';
import 'package:skillshark/components/db_service.dart';
import 'package:skillshark/components/models.dart';
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
  @override
  Widget build(BuildContext context) {
    return Container(
      width: widget.width,
      child: StreamBuilder<Comment>(
          stream: DatabaseService().getComment(widget.postid, widget.commentid),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Container(
                child: Column(
                  children: [
                    StreamBuilder<Usr>(
                        stream: DatabaseService().getUser(snapshot.data.userid),
                        builder: (context, snapshot) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(snapshot.data.name ?? ''),
                              profilePreview(10, snapshot.data.uid),
                            ],
                          );
                        }),
                    Expanded(
                      child: Text(snapshot.data.commentTxt),
                    ),
                    Container(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_upward_rounded),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.arrow_upward_rounded),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              );
            } else {
              return CircularProgressIndicator();
            }
          }),
    );
  }
}