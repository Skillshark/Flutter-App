import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillshark/components/db_service.dart';
import 'package:skillshark/components/models.dart';
import 'package:skillshark/project/project.dart';
import 'package:url_launcher/url_launcher.dart';

Widget pcard2(Size size, String uid) {
  return StreamBuilder<Usr>(
      stream: DatabaseService().getUser(uid),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return ConstrainedBox(
            constraints: BoxConstraints(maxWidth: 50),
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(children: [
                SizedBox(
                  height: 15,
                ),
                Stack(
                  children: [
                    Container(
                      height: 110,
                      width: 160,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      height: 100,
                      width: 150,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(snapshot.data.dplink.toString()),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 0,
                ),
                Text(
                  'Tony Stark',
                  style: GoogleFonts.roboto(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Colors.black),
                ),
                SizedBox(
                  height: 3,
                ),
                t('Car Racer'),
                SizedBox(
                  height: 3,
                ),
                t('Porsche Cars'),
                SizedBox(
                  height: 3,
                ),
                t('www.porsche.com'),
                SizedBox(
                  height: 3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_location,
                      size: 12,
                      color: Colors.grey,
                    ),
                    t('Stuttgart, Germany'),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                RaisedButton(
                    onPressed: () {},
                    color: Colors.blue,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8, right: 8),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15, right: 15),
                        child: Text(
                          'Follow',
                          style: GoogleFonts.lato(color: Colors.white),
                        ),
                      ),
                    )),
                SizedBox(
                  height: 10,
                ),
                FlatButton(
                    onPressed: () {},
                    color: Colors.blue.withOpacity(0.3),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Text(
                        'Message',
                        style: GoogleFonts.lato(color: Colors.blue[500]),
                      ),
                    )),
                SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    StreamBuilder<List<Post>>(
                        stream: DatabaseService()
                            .streamProfilePost(snapshot.data.uid),
                        builder: (context, snapshot) {
                          return cc(snapshot.data.length.toString() ?? '',
                              'Projects');
                        }),
                    SizedBox(
                      width: 10,
                    ),
                    cc('65K', 'Followers'),
                    SizedBox(
                      width: 10,
                    ),
                    cc('350', 'Following'),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: Container(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [SizedBox()],
                          ),
                          ti('About'),
                          SizedBox(
                            height: 2,
                          ),
                          b(
                            'Im a Car Racer with 5 years of experience in Porsche Car Industries Germany',
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ti('Skills'),
                          SizedBox(
                            height: 2,
                          ),
                          b('Car Racing, Mechanic, Vehicle Testing'),
                          SizedBox(
                            height: 10,
                          ),
                          ti('Experience'),
                          SizedBox(
                            height: 2,
                          ),
                          Row(
                            children: [
                              b('Car Racer'),
                              SizedBox(
                                width: 2,
                              ),
                              t('5 Years')
                            ],
                          ),
                          SizedBox(
                            width: 2,
                          ),
                          t('Porsche Cars, Germany'),
                          SizedBox(
                            height: 10,
                          ),
                          ti('Contact'),
                          SizedBox(
                            height: 2,
                          ),
                          b('tonystark@gmail.com'),
                          SizedBox(
                            height: 2,
                          ),
                          b('+49 564899812'),
                          SizedBox(
                            height: 10,
                          ),
                          t('Social Media'),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              icon(
                                Icon(
                                  FeatherIcons.github,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                snapshot.data.gitHub,
                                snapshot.data.uid,
                                true,
                              ),
                              icon(
                                Icon(FeatherIcons.linkedin,
                                    color: Colors.white, size: 20),
                                snapshot.data.linkedIn,
                                snapshot.data.uid,
                                true,
                              ),
                              icon(
                                Icon(
                                  FeatherIcons.linkedin,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                snapshot.data.linkedIn,
                                snapshot.data.uid,
                                true,
                              ),
                              icon(
                                Icon(
                                  FeatherIcons.twitter,
                                  color: Colors.white,
                                  size: 20,
                                ),
                                snapshot.data.linkedIn,
                                snapshot.data.uid,
                                true,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                )
              ]),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      });
}

void _launchURL(String url) async =>
    await canLaunch(url) ? await launch(url) : throw 'Could not launch $url';

Widget t(String v) {
  return Text(
    v,
    style: GoogleFonts.roboto(fontSize: 12, color: Colors.grey),
  );
}

Widget b(String v) {
  return Text(
    v,
    style: GoogleFonts.roboto(
      fontSize: 12,
    ),
  );
}

Widget s(String v) {
  return Text(
    v,
    style: GoogleFonts.roboto(fontSize: 12),
  );
}

Widget tk(String v) {
  return Text(
    v,
    style: GoogleFonts.roboto(fontSize: 16, color: Colors.blue[600]),
  );
}

Widget ti(String v) {
  return Text(
    v,
    style: GoogleFonts.roboto(fontSize: 14, color: Colors.blue),
  );
}

Widget icon(Icon i, String url, String uid, bool b) {
  return StreamBuilder<Usr>(
      stream: DatabaseService().getUser(uid),
      builder: (context, snapshot) {
        if (snapshot.hasData && b) {
          return InkWell(
            onTap: () {
              _launchURL(url);
            },
            child: Padding(
              padding: const EdgeInsets.all(4.0),
              child: Container(
                color: Colors.blue[700],
                child: Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: i,
                ),
              ),
            ),
          );
        } else {
          return SizedBox.shrink();
        }
      });
}

Widget cc(String v, String p) {
  return Column(
    children: [
      tk(v),
      SizedBox(
        height: 2,
      ),
      Text(
        p,
        style: GoogleFonts.roboto(fontSize: 13, color: Colors.black),
      )
    ],
  );
}
