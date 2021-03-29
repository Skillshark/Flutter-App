import 'package:flutter/material.dart';
import 'package:skillshark/components/profile_preview.dart';

class videoWindow extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var searchTextController = TextEditingController();

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
                        onTap: () {},
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
        ],
      ),
    );
  }
}
