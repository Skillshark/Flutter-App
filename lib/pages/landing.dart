import 'package:flutter/material.dart';
import 'package:skillshark/components/post.dart';

class landingScreen extends StatefulWidget {
  @override
  _landingScreenState createState() => _landingScreenState();
}

class _landingScreenState extends State<landingScreen> {
  var searchTextController = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
                          Navigator.pushNamed(context, '/login');
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
                              'Log in',
                              style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushNamed(context, '/signup');
                        },
                        child: Container(
                          height: 25,
                          width: 100,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12.5),
                            color: Colors.grey,
                            border: Border.all(
                              color: Colors.black54,
                              width: 2,
                            ),
                          ),
                          child: Center(
                            child: Text(
                              'Sign Up',
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
          )
        ],
      ),
    );
  }
}
