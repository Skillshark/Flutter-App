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
  final int likes;

  Post(
      {this.postid,
      this.title,
      this.tags,
      this.bio,
      this.userid,
      this.videoUrl,
      this.thumbnailUrl,
      this.timestamp,
      this.likes});

  factory Post.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();

    return Post(
      postid: doc.id,
      title: data['title'] ?? '',
      tags: data['tags'] ?? null,
      bio: data['bio'] ?? '',
      userid: data['userid'] ?? '',
      videoUrl: data['videourl'] ?? '',
      thumbnailUrl: data['thumbnailurl'] ?? '',
      timestamp: data['timestamp'].toDate(),
      likes: data['likes'] ?? 0,
    );
  }
}
