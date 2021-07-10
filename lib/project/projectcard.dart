import 'package:flutter/cupertino.dart';

import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillshark/components/db_service.dart';
import 'package:skillshark/components/models.dart';
import 'package:skillshark/components/profile_preview.dart';
import 'package:skillshark/model/livem.dart';
import 'package:skillshark/model/projectm.dart';
import 'package:skillshark/model/up.dart';

Widget Pcard(Size size, String postid) {
  return StreamBuilder<Post>(
      stream: DatabaseService().getPost(postid),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: PhysicalModel(
              elevation: 5,
              color: Colors.black,
              borderRadius: BorderRadius.circular(10),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          image: DecorationImage(
                              image: NetworkImage(
                                snapshot.data.thumbnailUrl == ''
                                    ? 'https://firebasestorage.googleapis.com/v0/b/skillshare-69b1f.appspot.com/o/defaults%2Fdownload.png?alt=media&token=442cd51b-fd5a-477a-aebd-8af3599ae9a9'
                                    : snapshot.data.thumbnailUrl.toString(),
                              ),
                              fit: BoxFit.cover),
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Container(
                                child: Stack(
                                  children: [
                                    Positioned(
                                        top: 5,
                                        right: 5,
                                        child: snapshot.data.videoUrl != ''
                                            ? Icon(
                                                Icons.video_call_outlined,
                                                color: Colors.white,
                                              )
                                            : SizedBox()),
                                    Align(
                                        alignment: Alignment.center,
                                        child: snapshot.data.videoUrl != ''
                                            ? Icon(
                                                Icons.play_circle_fill_rounded,
                                                size: 40,
                                                color: Colors.white,
                                              )
                                            : SizedBox())
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                        child: Container(
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            AutoSizeText(
                              snapshot.data.title == null
                                  ? ''
                                  : snapshot.data.title.toString(),
                              style: GoogleFonts.lato(
                                  fontSize: 15,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                              maxLines: 2,
                              overflow: TextOverflow.clip,
                            ),
                            SizedBox(
                              height: 2,
                            ),
                            Container(
                              width: size.width / 4 - 40,
                              height: 25,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: snapshot.data.tags.map((el) {
                                  return Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.grey[300],
                                      ),
                                      child: Padding(
                                        padding: const EdgeInsets.all(4.0),
                                        child: Text(
                                          el,
                                          style: TextStyle(
                                              fontSize: 9,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                    ),
                                  );
                                }).toList(),
                              ),
                            ),
                            Expanded(child: Container()),
                            Row(
                              children: [
                                profilePreview(8, snapshot.data.userid),
                                SizedBox(
                                  width: 5,
                                ),
                                Expanded(
                                  flex: 3,
                                  child: StreamBuilder<Usr>(
                                      stream: DatabaseService()
                                          .getUser(snapshot.data.userid),
                                      builder: (context, snapshot) {
                                        if (snapshot.hasData) {
                                          return Text(
                                            snapshot.data.name,
                                            style: TextStyle(
                                              fontSize: 12,
                                              fontWeight: FontWeight.w500,
                                            ),
                                            overflow: TextOverflow.ellipsis,
                                          );
                                        } else {
                                          return Text('');
                                        }
                                      }),
                                ),
                                Expanded(
                                    flex: 2,
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.chat_bubble,
                                          size: 12,
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        StreamBuilder<List<Comment>>(
                                            stream: DatabaseService()
                                                .streamComment(
                                                    snapshot.data.postid),
                                            builder: (context, snapshot) {
                                              if (snapshot.hasData) {
                                                return Text(
                                                  snapshot.data.length
                                                      .toString(),
                                                  style:
                                                      TextStyle(fontSize: 12),
                                                );
                                              } else {
                                                return Text('0');
                                              }
                                            }),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(Icons.thumb_up,
                                            size: 12,
                                            color: true
                                                ? Colors.blue
                                                : Colors.black),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Text(
                                          snapshot.data.upvote.toString(),
                                          style: TextStyle(
                                              color: true
                                                  ? Colors.blue
                                                  : Colors
                                                      .black, //TODO: Change this with backend correction from post like
                                              fontSize: 14),
                                        ),
                                        SizedBox(
                                          width: 5,
                                        ),
                                        Icon(
                                          Icons.save,
                                          size: 12,
                                        ),
                                      ],
                                    ))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ))
                  ],
                ),
              ),
            ),
          );
        } else {
          return CircularProgressIndicator();
        }
      });
}
