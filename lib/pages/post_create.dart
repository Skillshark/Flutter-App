import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:skillshark/components/postdata_service.dart';
import 'package:skillshark/components/profile_preview.dart';
import 'package:skillshark/pages/post_edit.dart';
import 'package:uuid/uuid.dart';

class createPost extends StatelessWidget {
  var titleController = TextEditingController();
  var currentUser = FirebaseAuth.instance.currentUser;
  final String postid = Uuid().v1().toString();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          PostdataService()
              .postCreate(postid, titleController.text, currentUser.uid);
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => posteditScreen(postid: postid)));
        },
        label: Text('Upload Content'),
        icon: Icon(Icons.arrow_forward_ios_outlined),
      ),
      body: Center(
        child: Column(
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
                            child: profilePreview(15, currentUser.uid),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 25,
              child: Text(
                'Create Post',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: MediaQuery.of(context).size.height - 85,
              child: Container(
                width: MediaQuery.of(context).size.width * .5,
                child: Column(
                  children: [
                    Text(
                      'Enter Title of Your Post....',
                      style:
                          TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
                    ),
                    TextField(
                      controller: titleController,
                      decoration: InputDecoration(
                          hintText: 'Enter Video Title',
                          hintStyle:
                              TextStyle(fontSize: 15, color: Colors.grey),
                          labelText: 'Title',
                          labelStyle:
                              TextStyle(fontSize: 15, color: Colors.black),
                          border: OutlineInputBorder()),
                      maxLength: 15,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
