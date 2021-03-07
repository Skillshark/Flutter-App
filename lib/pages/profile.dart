import 'package:flutter/material.dart';
import 'package:skillshark/components/post.dart';

class profileScreen extends StatefulWidget {
  @override
  _profileScreenState createState() => _profileScreenState();
}

class _profileScreenState extends State<profileScreen> {
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
                      IconButton(
                        icon: Icon(Icons.notifications_none_outlined),
                        onPressed: () {},
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
                          height: MediaQuery.of(context).size.width * .2,
                          padding: EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: AssetImage('images/profile.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        child: Text(
                          'Saswat Nayak',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(),
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
      ),
    );
  }
}
