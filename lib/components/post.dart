import 'package:flutter/material.dart';
import 'package:skillshark/components/db_service.dart';
import 'package:skillshark/components/models.dart';

class post extends StatefulWidget {
  String postid;

  post({
    this.postid,
    Key key,
  }) : super(key: key);
  @override
  _postState createState() => _postState();
}

class _postState extends State<post> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Post>(
        stream: DatabaseService().getPost(widget.postid),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/video_player');
              },
              child: Container(
                padding: EdgeInsets.all(8.0),
                width: 300,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(8.0),
                      height: 200,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(
                            'https://firebasestorage.googleapis.com/v0/b/skillshare-69b1f.appspot.com/o/defaults%2Fsignup.jpg?alt=media&token=7c44d9eb-9038-4327-a03a-c4df316ebc27',
                          ),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    Container(
                      height: 20,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              //add profile
                              Container(
                                child: Text(
                                  'Saswat Nayak',
                                  style: TextStyle(fontWeight: FontWeight.w900),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.thumb_up_alt_outlined,
                                      size: 12.5,
                                    ),
                                    Text('6.6k'),
                                    SizedBox(
                                      width: 1,
                                    ),
                                    Icon(
                                      Icons.message_outlined,
                                      size: 12.5,
                                    ),
                                    Text('1.1k'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return Container(
              padding: EdgeInsets.all(8.0),
              width: 300,
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(8.0),
                    height: 200,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('images/download.png'),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  Container(
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            //add profile
                            Container(
                              child: Text(
                                'Saswat Nayak',
                                style: TextStyle(fontWeight: FontWeight.w900),
                              ),
                            ),
                          ],
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Row(
                                children: [
                                  Icon(
                                    Icons.thumb_up_alt_outlined,
                                    size: 12.5,
                                  ),
                                  Text('6.6k'),
                                  SizedBox(
                                    width: 1,
                                  ),
                                  Icon(
                                    Icons.message_outlined,
                                    size: 12.5,
                                  ),
                                  Text('1.1k'),
                                ],
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
        });
  }
}
