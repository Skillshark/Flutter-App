import 'package:flutter/material.dart';
import 'package:skillshark/components/db_service.dart';
import 'package:skillshark/components/models.dart';
import 'package:skillshark/components/profile_preview.dart';

class CommentTile extends StatefulWidget {
  String commentid;
  String postid;

  CommentTile({Key key, this.commentid, this.postid}) : super(key: key);

  @override
  _CommentTileState createState() => _CommentTileState();
}

class _CommentTileState extends State<CommentTile> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Comment>(
        stream: DatabaseService().getComment(widget.postid, widget.commentid),
        builder: (context, snapshot) {
          return Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    profilePreview(10),
                    StreamBuilder<Usr>(
                        stream: DatabaseService().getUser(snapshot.data.userid),
                        builder: (context, snapshot) {
                          return Text(snapshot.data.name ?? '');
                        }),
                  ],
                ),
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
        });
  }
}
