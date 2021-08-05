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

  final _formKey = GlobalKey<FormState>();

  submit() {
    if (_formKey.currentState.validate()) {
      List tags = tagController.text.split(',');
      List tools = toolController.text.split(',');
      List catagoy = tagController.text.split(',');
      try {
        PostdataService().postEdit3(widget.postid, tags, tools, catagoy);
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
              Stack(
                children: [
                  Container(
                    child: StreamBuilder<Post>(
                        stream: DatabaseService().getPost(widget.postid),
                        builder: (context, snapshot) {
                          if (snapshot.hasData) {
                            return Container(
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      NetworkImage(snapshot.data.thumbnailUrl),
                                ),
                              ),
                            );
                          } else {
                            return Center(
                              child: SizedBox.shrink(),
                            );
                          }
                        }),
                  ),
                  ThumbnailUploader(
                    postid: widget.postid,
                  ),
                ],
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
