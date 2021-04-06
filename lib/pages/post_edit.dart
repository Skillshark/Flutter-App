import 'dart:html';

import 'package:flutter/material.dart';
import 'package:skillshark/components/profile_preview.dart';
import 'package:skillshark/components/storage_service.dart';

class postEdit extends StatelessWidget {
  var titleController = TextEditingController();
  var bioController = TextEditingController();
  var tagController = TextEditingController();
  var searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {},
        icon: Icon(Icons.upload_outlined),
        label: Text('Upload'),
      ),
      backgroundColor: Colors.white,
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
                            Navigator.pushNamed(context, '/post_edit');
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
            SizedBox(
              height: 10,
            ),
            Container(
              height: 25,
              child: Text(
                'Edit Post',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
                padding: EdgeInsets.all(10),
                height: MediaQuery.of(context).size.height - 85,
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          //upload preview
                          Container(
                            height: 200,
                            width: 300,
                            color: Colors.grey,
                            child: Center(
                              child: InkWell(
                                  //child: VidUploader(),
                                  ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            height: 200,
                            width: 300,
                            color: Colors.grey,
                            child: Center(
                              child: InkWell(
                                child: Container(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Center(
                        child: Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 10, vertical: 10),
                          child: ListView(
                            children: [
                              Container(
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    //Title
                                    TextField(
                                      controller: titleController,
                                      decoration: InputDecoration(
                                          hintText: 'Enter Video Title',
                                          hintStyle: TextStyle(
                                              fontSize: 15, color: Colors.grey),
                                          labelText: 'Title',
                                          labelStyle: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                          border: OutlineInputBorder()),
                                      maxLength: 15,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    //Bio
                                    TextField(
                                      controller: bioController,
                                      decoration: InputDecoration(
                                          hintText: 'Enter Video Bio',
                                          hintStyle: TextStyle(
                                              fontSize: 15, color: Colors.grey),
                                          labelText: 'Bio',
                                          labelStyle: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                          border: OutlineInputBorder()),
                                      maxLength: 25,
                                      maxLines: 5,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    //Tags
                                    TextField(
                                      controller: tagController,
                                      decoration: InputDecoration(
                                          hintText: 'Enter Tags',
                                          hintStyle: TextStyle(
                                              fontSize: 15, color: Colors.grey),
                                          labelText: 'Tags',
                                          labelStyle: TextStyle(
                                              fontSize: 15,
                                              color: Colors.black),
                                          border: OutlineInputBorder()),
                                      maxLength: 25,
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
