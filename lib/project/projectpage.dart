import 'package:flick_video_player/flick_video_player.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skillshark/addproject/wid.dart';
import 'package:skillshark/components/db_service.dart';
import 'package:skillshark/components/models.dart';
import 'package:skillshark/components/postdata_service.dart';
import 'package:skillshark/components/profile_preview.dart';
import 'package:skillshark/components/video_player.dart';
import 'package:skillshark/controller/pagecon.dart';
import 'package:skillshark/model/learn.dart';
import 'package:skillshark/project/projectcard.dart';
import 'package:skillshark/project/tab/about.dart';
import 'package:skillshark/project/tab/comment.dart';
import 'package:skillshark/project/tab/discover.dart';
import 'package:video_player/video_player.dart';

class Propage extends StatefulWidget {
  final String postid;

  Propage({Key key, this.postid}) : super(key: key);

  @override
  _PropageState createState() => _PropageState();
}

class _PropageState extends State<Propage> with SingleTickerProviderStateMixin {
  Size size;
  Pagecontrol pp;
  TabController _tabController;
  int index = 0;
  @override
  Widget build(BuildContext context) {
    List<Widget> w = [
      About(
        postid: widget.postid,
      ),
      Discover(
        postid: widget.postid,
      ),
      CommentView(
        postid: widget.postid,
      )
    ];
    size = MediaQuery.of(context).size;
    pp = Provider.of<Pagecontrol>(context);
    return StreamBuilder<Post>(
        stream: DatabaseService().getPost(widget.postid),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return DefaultTabController(
              length: 3,
              child: Scaffold(
                body: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30, top: 20),
                  child: ListView(
                    physics: BouncingScrollPhysics(),
                    children: [
                      InkWell(
                        child: text('< Back'),
                        onTap: () {
                          Navigator.pop(context);
                        },
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Project',
                        style: GoogleFonts.roboto(
                          fontSize: 23,
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        width: size.width,
                        height: 450,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                        child: VideoApp(
                                          videoUrl: snapshot.data.videoUrl,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Container(
                                      height: 70,
                                      width: size.width / 2,
                                      child: Row(
                                        children: [
                                          Container(
                                            height: 19,
                                            width: 19,
                                            decoration: BoxDecoration(
                                              color:
                                                  Colors.blue.withOpacity(0.4),
                                              shape: BoxShape.circle,
                                            ),
                                            child: Icon(
                                              Icons.arrow_back_ios_rounded,
                                              color: Colors.blue[900],
                                              size: 12,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Expanded(
                                            child: Container(
                                              child: ListView(
                                                scrollDirection:
                                                    Axis.horizontal,
                                                physics:
                                                    BouncingScrollPhysics(),
                                                children: l.map((e) {
                                                  return Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            3.0),
                                                    child: Container(
                                                      height: 70,
                                                      width: 100,
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(15),
                                                        image: DecorationImage(
                                                          image: AssetImage(
                                                            e.assest,
                                                          ),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Container(
                                            height: 19,
                                            width: 19,
                                            decoration: BoxDecoration(
                                                color: Colors.blue
                                                    .withOpacity(0.4),
                                                shape: BoxShape.circle),
                                            child: Icon(
                                              Icons.arrow_forward_ios,
                                              color: Colors.blue[900],
                                              size: 12,
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Card(
                              elevation: 2,
                              child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 20, right: 20),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Icon(
                                            Icons.more_horiz,
                                            size: 25,
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        snapshot.data.title,
                                        style: GoogleFonts.roboto(
                                            fontSize: 23,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis',
                                        style: GoogleFonts.roboto(fontSize: 17),
                                      ),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Wrap(
                                        direction: Axis.horizontal,
                                        children: snapshot.data.tags
                                            .map(
                                              (el) => Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                    padding:
                                                        EdgeInsets.all(8.0),
                                                    color: Colors.grey,
                                                    child: Text(el)),
                                              ),
                                            )
                                            .toList()
                                            .cast<Widget>(),
                                      ),
                                      Expanded(
                                        child: Container(),
                                      ),
                                      StreamBuilder<Usr>(
                                          stream: DatabaseService()
                                              .getUser(snapshot.data.userid),
                                          builder: (context, snapshot) {
                                            if (snapshot.hasData) {
                                              return Row(
                                                children: [
                                                  profilePreview(
                                                    13,
                                                    snapshot.data.uid,
                                                  ),
                                                  SizedBox(
                                                    width: 9,
                                                  ),
                                                  Column(
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Text(
                                                        snapshot.data.name,
                                                        style:
                                                            GoogleFonts.roboto(
                                                          fontSize: 16,
                                                          color: Colors.blue,
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height: 2,
                                                      ),
                                                      Text(
                                                          'GPS Technology Specialist'),
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
                                                      )
                                                    ],
                                                  ),
                                                  Expanded(child: Container()),
                                                  ElevatedButton(
                                                    onPressed: () {},
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              8.0),
                                                      child: Text('Follow'),
                                                    ),
                                                  ),
                                                ],
                                              );
                                            } else {
                                              return Center(
                                                child:
                                                    CircularProgressIndicator(),
                                              );
                                            }
                                          }),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      Row(
                                        children: [
                                          InkWell(
                                            onTap: () {},
                                            child: Icon(
                                              Icons.thumb_up,
                                              color: Colors.blue,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2,
                                          ),
                                          Text(
                                            snapshot.data.upvote.toString(),
                                            style:
                                                TextStyle(color: Colors.blue),
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(
                                            Icons.share,
                                          ),
                                          SizedBox(
                                            width: 10,
                                          ),
                                          Icon(
                                            Icons.save,
                                          ),
                                          Expanded(child: Container()),
                                          Text(
                                            'As follows',
                                            style: TextStyle(fontSize: 10),
                                          ),
                                          SizedBox(
                                            width: 5,
                                          ),
                                          icon(
                                            Icon(
                                              FeatherIcons.facebook,
                                              color: Colors.white,
                                            ),
                                          ),
                                          icon(
                                            Icon(
                                              FeatherIcons.twitter,
                                              color: Colors.white,
                                            ),
                                          ),
                                          icon(
                                            Icon(
                                              FeatherIcons.linkedin,
                                              color: Colors.white,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 20,
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            )),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Container(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      Expanded(
                                        flex: 3,
                                        child: Container(
                                          child: TabBar(
                                              onTap: (i) {
                                                setState(() {
                                                  index = i;
                                                });
                                              },
                                              controller: _tabController,
                                              labelPadding: EdgeInsets.all(2),
                                              indicatorPadding:
                                                  EdgeInsets.all(2),
                                              indicatorSize:
                                                  TabBarIndicatorSize.label,
                                              indicatorWeight: 2.0,
                                              labelColor: Colors.blue,
                                              unselectedLabelColor:
                                                  Colors.grey[700],
                                              tabs: [
                                                Tab(
                                                  child: Text(
                                                    'About',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Tab(
                                                  child: Text(
                                                    'Documentary',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                                Tab(
                                                  child: Text(
                                                    'Comments',
                                                    style: TextStyle(
                                                      fontSize: 18,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                    ),
                                                  ),
                                                ),
                                              ]),
                                        ),
                                      ),
                                      Expanded(flex: 1, child: Container()),
                                    ],
                                  ),
                                  w[index]
                                ],
                              ),
                            ),
                          ),
                          Expanded(
                              flex: 1,
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Explore More',
                                      style: GoogleFonts.roboto(
                                          fontSize: 22,
                                          color: Colors.blue[800],
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 25,
                                    ),
                                    Container(
                                      height: 35,
                                      width: double.maxFinite,
                                      // child: chipp(tl),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Container(
                                      height: 35,
                                      width: double.maxFinite,
                                      child: chipp(tt),
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Similar Profiles',
                                      style: GoogleFonts.roboto(
                                          fontSize: 18,
                                          color: Colors.blue[900],
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    // ListView(
                                    // shrinkWrap: true,
                                    // physics: NeverScrollableScrollPhysics(),
                                    // children: user.map((e) => listiles(e)).toList(),
                                    // ),
                                  ],
                                ),
                              )),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      index == 1
                          ? Text(
                              'Suggested Projects',
                              style: GoogleFonts.roboto(
                                  fontSize: 20,
                                  color: Colors.blue[900],
                                  fontWeight: FontWeight.bold),
                            )
                          : SizedBox(),
                      SizedBox(
                        height: 10,
                      ),
                      index == 1
                          ? StreamBuilder<List<Post>>(
                              stream: DatabaseService().streamPost(),
                              builder: (context, snapshot) {
                                return Container(
                                  width: size.width,
                                  height: 300,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemCount: 8,
                                    itemBuilder:
                                        (BuildContext context, int index) {
                                      return Container(
                                        height: 300,
                                        width: 250,
                                        child: Pcard(
                                            size,
                                            snapshot.data
                                                .elementAt(index)
                                                .postid),
                                      );
                                    },
                                  ),
                                );
                              })
                          : SizedBox(),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget icon(Icon icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          color: Colors.blue[700],
          child: Padding(
            padding: const EdgeInsets.all(2.0),
            child: icon,
          )),
    );
  }
}
