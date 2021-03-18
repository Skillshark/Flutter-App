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
      linkedIn: data['linkedIn'] ?? '',
      gitHub: data['gitHub'] ?? '',
      dplink: data[''] ?? '',
    );
  }
}

class Post {
  final String postid;
  final String title;
  final List tags;
  final String bio;

  Post({this.postid, this.title, this.tags, this.bio});

  factory Post.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();

    return Post(
      postid: doc.id,
      title: ['title'] ?? '',
      tags: ['tags'] ?? '',
      bio: ['bio'] ?? '',
    );
  }
}
