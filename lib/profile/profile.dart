import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skillshark/components/db_service.dart';
import 'package:skillshark/components/models.dart';
import 'package:skillshark/controller/pagecon.dart';
import 'package:skillshark/profile/profilecard.dart';
import 'package:skillshark/profile/profilecard2.dart';
import 'package:skillshark/profile/tabs/livetab.dart';
import 'package:skillshark/profile/tabs/pproject.dart';
import 'package:skillshark/profile/tabs/saved.dart';

class Profile extends StatefulWidget {
  final String userid;
  Profile({Key key, this.userid}) : super(key: key);

  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  Size size;
  int index = 0;
  List h = [false, false, false];
  TabController tabController;
  Pagecontrol pp;

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    size = MediaQuery.of(context).size;
    pp = Provider.of<Pagecontrol>(context);
    List t = [
      ptab(size, pp, widget.userid),
      livetab(size, pp, widget.userid),
      savedtab(size, pp, widget.userid)
    ];
    return Scaffold(
      body: ListView(
        children: [
          Stack(
            children: [
              Container(
                height: 190,
                width: size.width,
                child: Image.asset(
                  'assets/images/cover_img_1.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
              SizedBox(
                height: 50,
              ),
              Container(
                height: size.height + 500,
                child: Row(
                  children: [
                    Expanded(
                        flex: 2,
                        child: Container(
                          child: ListView(
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              SizedBox(
                                height: 90,
                              ),
                              Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: PhysicalModel(
                                  elevation: 3,
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey,
                                  child: ConstrainedBox(
                                    constraints: BoxConstraints(
                                      maxHeight: 680,
                                      maxWidth: 300,
                                    ),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      child: widget.userid == firebaseUser.uid
                                          ? pcard(size, widget.userid)
                                          : pcard2(size, widget.userid),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )),
                    Expanded(
                      flex: 4,
                      child: Container(
                        child: Column(
                          children: [
                            SizedBox(
                              height: 210,
                            ),
                            Row(
                              children: [
                                tabtext('Projects', 0),
                                tabtext('Live Streams', 1),
                                tabtext(' Saved', 2),
                              ],
                            ),
                            Container(
                              height: 500,
                              child: ListView(
                                children: [
                                  t[index],
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            FlatButton(
                                onPressed: () {},
                                color: Colors.blue.withOpacity(0.3),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10)),
                                child: Padding(
                                  padding:
                                      const EdgeInsets.only(left: 8, right: 8),
                                  child: Text(
                                    'Load More',
                                    style: GoogleFonts.lato(
                                        color: Colors.blue[500]),
                                  ),
                                )),
                            SizedBox(
                              height: 20,
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    tabController = TabController(length: 3, vsync: this);
  }

  Widget tabtext(String s, int i) {
    return InkWell(
      hoverColor: Colors.white,
      onHover: (e) {
        setState(() {
          h[i] = e;
        });
      },
      onTap: () {
        setState(() {
          index = i;
        });
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              s,
              style: TextStyle(
                  fontSize: 19,
                  color: index == i
                      ? Colors.blue
                      : h[i] == true
                          ? Colors.green.withOpacity(0.5)
                          : Colors.grey,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              width: 90,
              child: Divider(
                thickness: 2,
                color: index == i
                    ? Colors.blue
                    : h[i] == true
                        ? Colors.green.withOpacity(0.5)
                        : Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
