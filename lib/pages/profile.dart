import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skillshark/components/authentication_services.dart';
import 'package:skillshark/components/db_service.dart';
import 'package:skillshark/components/models.dart';
import 'package:skillshark/components/post.dart';
import 'package:provider/provider.dart';
import 'package:skillshark/components/profile_preview.dart';
import 'package:skillshark/components/userdata_service.dart';

class profileScreen extends StatefulWidget {
  @override
  _profileScreenState createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
  var searchTextController = TextEditingController();
  final db = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    var currentUser = FirebaseAuth.instance.currentUser;

    return Scaffold(
      body: StreamBuilder<Usr>(
          stream: DatabaseService().getUser(currentUser.uid),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Column(
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 5),
                    height: 40,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Text(
                            'Skillshark',
                            style: TextStyle(
                              fontSize: 25,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 10,
                          color: Colors.black,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .5,
                          child: TextField(
                            controller: searchTextController,
                            decoration: InputDecoration(
                              hintText: 'Search',
                              prefixIcon: Icon(Icons.search_outlined),
                            ),
                          ),
                        ),
                        Divider(
                          thickness: 10,
                          color: Colors.black,
                        ),
                        Container(
                          child: Row(
                            children: [
                              IconButton(
                                icon: Icon(Icons.notifications_none_outlined),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            context.read<AuthenticationService>().signOut();
                            Navigator.pushNamed(context, '/');
                          },
                          child: Container(
                            height: 25,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12.5),
                              border: Border.all(
                                color: Colors.black54,
                                width: 2,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                'Log Out',
                                style: TextStyle(
                                  fontSize: 15,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height - 40,
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * .25,
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(2),
                          ),
                          child: ListView(
                            shrinkWrap: true,
                            children: [
                              Center(
                                child: Container(
                                  width: MediaQuery.of(context).size.width * .2,
                                  height:
                                      MediaQuery.of(context).size.width * .2,
                                  padding: EdgeInsets.all(8),
                                  child: profilePreview(
                                    MediaQuery.of(context).size.width * .2 / 2,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: (snapshot.data.name != null)
                                    ? Text(
                                        snapshot.data.name,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      )
                                    : Text(''),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pushNamed(
                                        context, '/profile_edit');
                                  },
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.black87,
                                    ),
                                    child: Text(
                                      'Edit Profile',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Container(
                                child: (snapshot.data.gitHub == null &&
                                        snapshot.data.linkedIn == null)
                                    ? Container(
                                        child: Text(
                                          'Links :',
                                          style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w300,
                                          ),
                                        ),
                                      )
                                    : SizedBox(),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * .75,
                          child: CustomScrollView(
                            slivers: [
                              SliverAppBar(
                                title: Text('Your Posts'),
                                foregroundColor: Colors.white,
                              ),
                              SliverGrid.extent(
                                maxCrossAxisExtent: 300,
                                mainAxisSpacing: 10,
                                crossAxisSpacing: 10,
                                children: [
                                  post(),
                                  post(),
                                  post(),
                                  post(),
                                  post(),
                                  post(),
                                  post(),
                                  post(),
                                  post(),
                                  post(),
                                  post(),
                                  post(),
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  )
                ],
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
