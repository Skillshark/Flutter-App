import 'package:flutter/material.dart';
import 'package:skillshark/components/db_service.dart';
import 'package:skillshark/components/models.dart';
import 'package:skillshark/pages/videoplayer_page.dart';

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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => vidPlayer(postid: widget.postid),
                  ),
                );
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
                          image: NetworkImage(snapshot.data.thumbnailUrl != ''
                              ? snapshot.data.thumbnailUrl
                              : 'https://firebasestorage.googleapis.com/v0/b/skillshare-69b1f.appspot.com/o/defaults%2Fdownload.png?alt=media&token=442cd51b-fd5a-477a-aebd-8af3599ae9a9'),
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
                                child: StreamBuilder<Usr>(
                                    stream: DatabaseService()
                                        .getUser(snapshot.data.userid),
                                    builder: (context, snapshot) {
                                      if (snapshot.hasData) {
                                        return Text(
                                          snapshot.data.name,
                                          style: TextStyle(
                                              fontWeight: FontWeight.w900),
                                        );
                                      } else {
                                        return Text('');
                                      }
                                    }),
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
                                    Text(snapshot.data.likes.toString()),
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
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Icon(Icons.image_not_supported),
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
