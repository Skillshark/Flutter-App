import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:markdown_editable_textinput/markdown_text_input.dart';
import 'package:skillshark/components/comment_tile.dart';
import 'package:skillshark/components/db_service.dart';
import 'package:skillshark/components/models.dart';
import 'package:skillshark/components/postdata_service.dart';
import 'package:provider/provider.dart';

class CommentView extends StatefulWidget {
  final String postid;

  CommentView({Key key, this.postid}) : super(key: key);

  @override
  _CommentViewState createState() => _CommentViewState();
}

class _CommentViewState extends State<CommentView> {
  String dec = '';
  final _formKey = GlobalKey<FormState>();
  var commentControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 200, top: 10),
      child: Column(
        children: [
          SizedBox(
            height: 10,
          ),
          Form(
            key: _formKey,
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: TextFormField(
                controller: commentControl,
                decoration: InputDecoration(hintText: 'Your comment here...'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Cannot be empty';
                  } else {
                    return null;
                  }
                },
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              OutlineButton(
                onPressed: () {},
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  'Reset',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
              SizedBox(
                width: 8,
              ),
              RaisedButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    if (firebaseUser != null) {
                      PostdataService().createComment(
                          widget.postid, commentControl.text, firebaseUser.uid);
                    } else {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Processing Data'),
                        ),
                      );
                    }
                  }
                },
                color: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                child: Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    'Post Comment',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Text(
                'Comments',
                style:
                    GoogleFonts.roboto(color: Colors.blue[900], fontSize: 18),
              ),
              SizedBox(
                width: 8,
              ),
              Text(
                '224',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
          Container(
            width: 400,
            height: 500,
            child: StreamBuilder<List<Comment>>(
                stream: DatabaseService().streamComment(widget.postid),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return CommentTile(
                            commentid: snapshot.data.elementAt(index).commentid,
                            postid: widget.postid,
                            width: 300,
                          );
                        },
                      ),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
          )
        ],
      ),
    );
  }
}
