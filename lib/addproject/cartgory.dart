import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillshark/addproject/wid.dart';
import 'package:skillshark/components/db_service.dart';
import 'package:skillshark/components/models.dart';
import 'package:skillshark/components/postdata_service.dart';
import 'package:skillshark/components/storage_service.dart';

class Cart extends StatefulWidget {
  final String postid;

  Cart({Key key, this.postid}) : super(key: key);

  @override
  CartState createState() => CartState();
}

class CartState extends State<Cart> {
  var tagController = TextEditingController();
  var catagoryController = TextEditingController();
  var linkController = TextEditingController();
  var toolController = TextEditingController();
  var scroll = ScrollController();

  final _formKey = GlobalKey<FormState>();

  submit() {
    if (_formKey.currentState.validate()) {
      List tags = tagController.text.split(',');
      List tools = toolController.text.split(',');
      List catagoy = tagController.text.split(',');
      try {
        PostdataService()
            .postEdit3(widget.postid, tags, tools, catagoy)
            .then((value) {
          StreamBuilder<Post>(
            stream: DatabaseService().getPost(widget.postid),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                if (snapshot.data.title != '' &&
                    snapshot.data.about != '' &&
                    snapshot.data.videoUrl != '' &&
                    snapshot.data.thumbnailUrl != '' &&
                    snapshot.data.tags != [] &&
                    snapshot.data.markdowntext != '') {
                  PostdataService().postEditDraft(widget.postid);
                  return null;
                } else {
                  return null;
                }
              } else {
                return null;
              }
            },
          );
        });
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
    return Scaffold(
      body: ListView(
        children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text('Category'),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Project Cover Image',
                        style: GoogleFonts.roboto(
                            fontSize: 18, fontWeight: FontWeight.w600),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 10, right: 8),
                            child: DottedBorder(
                              color: Colors.grey[600],
                              strokeWidth: 1,
                              child: Container(
                                height: 220,
                                width: 250,
                                decoration: BoxDecoration(
                                  color: Colors.grey[200],
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.image_outlined,
                                          size: 60,
                                          color: Colors.grey[400],
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Icon(
                                          Icons.videocam_rounded,
                                          size: 60,
                                          color: Colors.grey[400],
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Image or GIF',
                                      style: GoogleFonts.roboto(
                                        fontSize: 12,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Minimum size 808 by 632 px',
                                      style: GoogleFonts.roboto(
                                        fontSize: 12,
                                        color: Colors.grey[400],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 10, right: 8),
                            child: StreamBuilder<Post>(
                                stream:
                                    DatabaseService().getPost(widget.postid),
                                builder: (context, snapshot) {
                                  if (snapshot.hasData &&
                                      snapshot.data.thumbnailUrl != null) {
                                    return Container(
                                      height: 220,
                                      width: 250,
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                snapshot.data.thumbnailUrl),
                                            fit: BoxFit.cover),
                                      ),
                                    );
                                  } else {
                                    return Container(
                                      height: 220,
                                      width: 250,
                                      color: Colors.transparent,
                                    );
                                  }
                                }),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 10,
                              right: 8,
                            ),
                            child: Container(
                              height: 220,
                              width: 250,
                              child: Center(
                                child: ThumbnailUploader(
                                  postid: widget.postid,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Add Team and Team Members',
                        style: GoogleFonts.roboto(
                          fontSize: 14,
                          color: Colors.blue,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Container(
                child: Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 30,
                      ),
                      tex('Tags'),
                      SizedBox(
                        height: 10,
                      ),
                      fields('Add Tags', tagController),
                      SizedBox(
                        height: 10,
                      ),
                      //add tags leta
                      Text(
                        'Tags are publicly shared details about your content \n that let others discover you more easily',
                        style: GoogleFonts.roboto(
                          fontSize: 12,
                          color: Colors.grey[400],
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      tex('Tools & Resources'),
                      SizedBox(
                        height: 10,
                      ),
                      fields(
                        'Software, Hardware, Materials used for project',
                        toolController,
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      tex('Categorize'),
                      SizedBox(
                        height: 10,
                      ),
                      fieldicon(
                          'Software, Hardware, Materials used for project'),
                      SizedBox(
                        height: 30,
                      ),
                      tex('Social Media Links'),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Facebook'),
                      SizedBox(
                        height: 10,
                      ),
                      fields('', linkController),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Facebook'),
                      SizedBox(
                        height: 10,
                      ),
                      fields('', linkController),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Instagram'),
                      SizedBox(
                        height: 10,
                      ),
                      fields('', linkController),
                      SizedBox(
                        height: 20,
                      ),
                      Text('Twitter'),
                      SizedBox(
                        height: 10,
                      ),
                      fields('', linkController),
                      Text('Linked In'),
                      SizedBox(
                        height: 10,
                      ),
                      fields('', linkController),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          OutlineButton(
                            onPressed: () {},
                            child: Text('Preview'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
