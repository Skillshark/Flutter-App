import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';

class Usr {
  final String uid;
  final String name;
  final String linkedIn;
  final String gitHub;
  final String dplink;

  Usr({this.uid, this.name, this.linkedIn, this.gitHub, this.dplink});

  factory Usr.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();

    return Usr(
      uid: doc.id,
      name: data['name'] ?? '',
      linkedIn: data['linkedin'] ?? '',
      gitHub: data['github'] ?? '',
      dplink: data['dpurl'] ?? '',
    );
  }
}

class Post {
  final String postid;
  final String title;
  final List tags;
  final String bio;
  final String userid;
  final String videoUrl;
  final String thumbnailUrl;
  DateTime timestamp;
  final int upvote;

  Post(
      {this.postid,
      this.title,
      this.tags,
      this.bio,
      this.userid,
      this.videoUrl,
      this.thumbnailUrl,
      this.timestamp,
      this.upvote});

  factory Post.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();

    return Post(
      postid: doc.id,
      title: data['title'] ?? '',
      tags: data['tags'] ?? null,
      bio: data['bio'] ?? '',
      userid: data['userid'] ?? '',
      videoUrl: data['videourl'] ??
          'https://firebasestorage.googleapis.com/v0/b/skillshare-69b1f.appspot.com/o/defaults%2Fvideo.mp4?alt=media&token=102033f6-b5b8-4578-acb6-18103b2bae42',
      thumbnailUrl: data['thumbnailurl'] ??
          'https://firebasestorage.googleapis.com/v0/b/skillshare-69b1f.appspot.com/o/defaults%2Fdownload.png?alt=media&token=442cd51b-fd5a-477a-aebd-8af3599ae9a9',
      timestamp: data['timestamp'].toDate() ?? DateTime.now(),
      upvote: data['upvote'] ?? 0,
    );
  }
}

class Comment {
  final commentid;
  final String userid;
  final String commentTxt;
  final DateTime time;
  final int upvote;
  final int downvote;

  Comment(
      {this.commentid,
      this.commentTxt,
      this.userid,
      this.time,
      this.upvote,
      this.downvote});

  factory Comment.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();

    return Comment(
        commentid: doc.id,
        userid: data['userid'] ?? '',
        commentTxt: data['commentTxt'] ?? '',
        time: data['time'] ?? DateTime.now(),
        upvote: data['upvote'] ?? 0,
        downvote: data['downvote'] ?? 0);
  }
}
