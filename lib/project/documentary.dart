import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skillshark/addproject/wid.dart';
import 'package:skillshark/components/db_service.dart';
import 'package:skillshark/components/models.dart';
import 'package:skillshark/components/profile_preview.dart';
import 'package:skillshark/controller/pagecon.dart';
import 'package:skillshark/profile/profile.dart';
import 'package:skillshark/project/projectdoc.dart';

class Documentary extends StatefulWidget {
  final String postid;

  Documentary({Key key, this.postid}) : super(key: key);

  @override
  _DoucumentaryState createState() => _DoucumentaryState();
}

class _DoucumentaryState extends State<Documentary> {
  Size size;
  Pagecontrol pp;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    pp = Provider.of<Pagecontrol>(context);

    return Scaffold(
      body: StreamBuilder<Post>(
          stream: DatabaseService().getPost(widget.postid),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                  right: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: tex('< Back to project'),
                    ),
                    Expanded(
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(
                              flex: 1,
                              child: Container(
                                child: b2(
                                  context,
                                  snapshot.data.userid,
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: Container(
                                  color: Colors.yellow,
                                  child: Prodoc(
                                    postid: widget.postid,
                                  ),
                                )),
                            Expanded(
                              flex: 1,
                              child: Container(),
                            ),
                          ],
                        ),
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
    );
  }
}

Widget b(BuildContext context) {
  return ListView(
    children: [],
  );
}

Widget b2(BuildContext context, String userid) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: ListView(
      children: [
        SizedBox(
          height: 20,
        ),
        StreamBuilder<Usr>(
            stream: DatabaseService().getUser(userid),
            builder: (context, snapshot) {
              return Card(
                elevation: 4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          text(snapshot.data.name),
                          Expanded(child: Container()),
                          Icon(
                            Icons.more_vert,
                            color: Colors.grey,
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [profilePreview(10, userid)],
                          ),
                          SizedBox(
                            width: 9,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                snapshot.data.name,
                                style: GoogleFonts.roboto(
                                    fontSize: 12, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 2,
                              ),
                              Text(
                                'GPS Technology Specialist',
                                style: GoogleFonts.roboto(fontSize: 11),
                              ),
                              SizedBox(
                                height: 3,
                              ),
                              Row(
                                children: [
                                  n('25k'),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  lp('Projects'),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  n('65k'),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  lp('Followers'),
                                  SizedBox(
                                    width: 4,
                                  ),
                                  n('584'),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  lp('Following'),
                                  SizedBox(
                                    width: 4,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  OutlineButton(
                                    onPressed: () {},
                                    color: Colors.blue,
                                    textColor: Colors.blue,
                                    child: Text(
                                      ('Follow'),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 3,
                                  ),
                                  OutlineButton(
                                    onPressed: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => Profile(
                                              userid: snapshot.data.uid),
                                        ),
                                      );
                                    },
                                    color: Colors.blue,
                                    textColor: Colors.blue,
                                    child: Text(
                                      ('View Projects'),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 25,
                              )
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
        SizedBox(
          height: 20,
        ),
        Text(
          'Tools & Resources',
          style: GoogleFonts.roboto(fontSize: 20, color: Colors.blue[700]),
        ),
        SizedBox(
          height: 10,
        ),
        // TODO: Enable the tools list
        //ListView(
        //shrinkWrap: true,
        //physics: NeverScrollableScrollPhysics(),
        //children: tool.map((e){
        //return Row(
        //children: [
        //CircleAvatar(
        //radius: 3,
        //backgroundColor: Colors.black,
        //),
        //SizedBox(width: 10,),
        //Container(child: Text(e)),
        //SizedBox(height:6,),
        //],
        //);
        //}).toList(),
        //),
        SizedBox(
          height: 20,
        ),
        Text(
          'Explore More',
          style: GoogleFonts.roboto(
            fontSize: 18,
            color: Colors.blue[800],
          ),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 35,
          width: double.maxFinite,
          //child: chipp(tl),
        ),
        SizedBox(
          height: 5,
        ),
        Container(
          height: 35,
          width: double.maxFinite,
          //child: chipp(tt),
        ),
      ],
    ),
  );
}
