import 'package:flutter/material.dart';

class postEdit extends StatelessWidget {
  var titleController = TextEditingController();
  var bioController = TextEditingController();
  var tagController = TextEditingController();

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
            Expanded(
                child: Row(
              children: [
                Expanded(
                  child: Column(
                    children: [
                      //upload preview
                    ],
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                      child: ListView(
                        children: [
                          Container(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                                          fontSize: 15, color: Colors.black),
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
                                          fontSize: 15, color: Colors.black),
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
                                          fontSize: 15, color: Colors.black),
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
