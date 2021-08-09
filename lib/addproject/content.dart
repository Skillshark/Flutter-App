import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillshark/addproject/addp.dart';
import 'package:skillshark/addproject/wid.dart';
import 'package:skillshark/component/wid.dart';
import 'package:skillshark/components/db_service.dart';
import 'package:skillshark/components/models.dart';
import 'package:skillshark/components/postdata_service.dart';
import 'package:skillshark/components/storage_service.dart';
import 'package:skillshark/components/video_player.dart';
import 'package:skillshark/model/learn.dart';

class Content extends StatefulWidget {
  final String postid;

  Content({Key key, this.postid}) : super(key: key);

  @override
  ContentState createState() => ContentState();
}

class ContentState extends State<Content> {
  List n = [1, 2];
  Size size;
  var title = TextEditingController();
  var desc = TextEditingController();
  var about = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  submit() {
    if (_formKey.currentState.validate()) {
      try {
        PostdataService().postEdit1(widget.postid, title.text, about.text);
      } finally {
        print('error');
      }
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            SizedBox(
              height: 15,
            ),
            Text(
              'Content',
              style: GoogleFonts.roboto(fontSize: 18, color: Colors.blue),
            ),
            SizedBox(
              height: 18,
            ),
            tex('Title'),
            SizedBox(
              height: 10,
            ),
            field('Give some title for this project', title),
            SizedBox(
              height: 18,
            ),
            tex('Short Description'),
            SizedBox(
              height: 10,
            ),
            field('Short description about your project', desc),
            SizedBox(
              height: 18,
            ),
            tex('Multimedia Content'),
            SizedBox(
              height: 18,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PhysicalModel(
                color: Colors.black12,
                elevation: 5,
                child: Container(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 270,
                        width: size.width,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 8, top: 8),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: ListView(
                                    scrollDirection: Axis.horizontal,
                                    physics: BouncingScrollPhysics(),
                                    children: n.map((e) {
                                      return e == 1
                                          ? StreamBuilder<Post>(
                                              stream: DatabaseService()
                                                  .getPost(widget.postid),
                                              builder: (context, snapshot) {
                                                if (snapshot.hasData) {
                                                  return Padding(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    child: DottedBorder(
                                                      color: Colors.grey[600],
                                                      strokeWidth: 1,
                                                      child: Container(
                                                        height: 250,
                                                        width: 300,
                                                        child: VideoApp(
                                                          key: UniqueKey(),
                                                          videoUrl: snapshot
                                                              .data.videoUrl,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                } else {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10, right: 8),
                                                    child: DottedBorder(
                                                      color: Colors.grey[600],
                                                      strokeWidth: 1,
                                                      child: Container(
                                                        height: 250,
                                                        width: 300,
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Colors.grey[200],
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Icon(
                                                                  Icons
                                                                      .image_outlined,
                                                                  size: 60,
                                                                  color: Colors
                                                                          .grey[
                                                                      400],
                                                                ),
                                                                SizedBox(
                                                                  width: 10,
                                                                ),
                                                                Icon(
                                                                  Icons
                                                                      .videocam_rounded,
                                                                  size: 60,
                                                                  color: Colors
                                                                          .grey[
                                                                      400],
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              'Add Photos or Videos.',
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                              .grey[
                                                                          400]),
                                                            ),
                                                            SizedBox(
                                                              height: 5,
                                                            ),
                                                            Text(
                                                              'You can add more than one multimedia file',
                                                              style: GoogleFonts
                                                                  .roboto(
                                                                      fontSize:
                                                                          12,
                                                                      color: Colors
                                                                              .grey[
                                                                          400]),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }
                                              })
                                          : Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 10, right: 8),
                                              child: DottedBorder(
                                                color: Colors.grey[600],
                                                strokeWidth: 1,
                                                child: Container(
                                                  height: 250,
                                                  width: 300,
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                      5,
                                                    ),
                                                    color: Colors.grey[200],
                                                  ),
                                                ),
                                              ),
                                            );
                                    }).toList(),
                                  ),
                                ),
                              ),
                              Container(
                                height: 250,
                                width: 100,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    VideoUploader(postid: widget.postid),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 20,
                          ),
                          RaisedButton(
                            onPressed: () {},
                            color: Colors.grey[400],
                            child: Text('Choose File'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            '(or) Drag and Drop',
                            style: GoogleFonts.roboto(
                                fontSize: 15, color: Colors.black54),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          'Photos (PNG, JPG or JPEG, GIF), Videos (mp4, MOV, AVI)',
                          style: GoogleFonts.roboto(
                              fontSize: 15, color: Colors.black),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            tex('About'),
            SizedBox(
              height: 15,
            ),
            bigfield('Basic info about project', Colors.grey[200], 270, about),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }
}
