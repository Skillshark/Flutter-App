import 'package:flutter/material.dart';
import 'package:skillshark/components/db_service.dart';
import 'package:skillshark/components/models.dart';
import 'package:skillshark/components/post.dart';
import 'package:skillshark/components/profile_preview.dart';

class dashboardScreen extends StatefulWidget {
  String postid;

  dashboardScreen({Key key, String postid}) : super(key: key);

  @override
  _dashboardScreenState createState() => _dashboardScreenState();
}

class _dashboardScreenState extends State<dashboardScreen> {
  var searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Post>(
        stream: DatabaseService().getPost(widget.postid),
        builder: (context, snapshot) {
          return Scaffold(
            body: Column(
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
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/post_create');
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
                                    'Upload Video',
                                    style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            IconButton(
                              icon: Icon(Icons.notifications_none_outlined),
                              onPressed: () {},
                            ),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, '/profile');
                              },
                              child: Container(
                                height: 30,
                                width: 30,
                                child: profilePreview(15),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height - 40,
                  padding: EdgeInsets.symmetric(vertical: 20),
                  child: CustomScrollView(
                    slivers: [
                      SliverAppBar(
                        title: Text('Your Feed'),
                        foregroundColor: Colors.white,
                      ),
                      SliverGrid(
                        delegate: SliverChildBuilderDelegate(
                            (BuildContext context, int index) {
                          return Center(
                            child: post(),
                          );
                        }),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 300,
                          mainAxisSpacing: 10,
                          crossAxisSpacing: 10,
                        ),
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
