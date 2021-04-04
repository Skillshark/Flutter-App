import 'package:flutter/material.dart';
import 'package:skillshark/components/video_player.dart';

class vidPlayer extends StatefulWidget {
  @override
  _vidPlayerState createState() => _vidPlayerState();
}

class _vidPlayerState extends State<vidPlayer> {
  var commentController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              padding: EdgeInsets.all(15),
              width: MediaQuery.of(context).size.width * .75,
              child: ListView(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * .5,
                    //vidplayer
                    child: VideoApp(),
                  ),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Title',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              //profilePreview(20),
                              Text(
                                'Creator Name',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w500),
                              )
                            ],
                          ),
                        ),
                        Text('This will be the bio of the video given above')
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(8, 8, 8, 25),
              width: MediaQuery.of(context).size.width * .25,
              height: MediaQuery.of(context).size.height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      'Comments',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * .50,
                    child: ListView(
                      children: [
                        //commentstiles
                      ],
                    ),
                  ),
                  Container(
                    height: 15,
                    child: TextField(
                      controller: commentController,
                      decoration: InputDecoration(
                        hintText: 'Write your comment here',
                        hintStyle: TextStyle(fontSize: 15, color: Colors.grey),
                        labelText: 'Comment',
                      ),
                    ),
                  )
                ],
              ),
            ),
            //Container(
            //width: MediaQuery.of(context).size.width * .25,
            //height: MediaQuery.of(context).size.height,
            //child: Column(
            //mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //children: [
            //Text(
            //'Comments',
            //style: TextStyle(
            //fontSize: 20,
            //fontWeight: FontWeight.bold,
            //),
            //),
            //ListView(
            //children: [
            ////comments
            //],
            //),
            //Row(
            //children: [
            //TextField(
            //controller: commentController,
            //),
            //IconButton(
            //onPressed: () {},
            //icon: Icon(Icons.send),
            //),
            //],
            //)
            //],
            //),
            //),
          ],
        ),
      ),
    );
  }
}
