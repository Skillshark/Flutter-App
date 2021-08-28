import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/cupertino.dart';

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
  final String shortdesc;
  final List tags;
  final String about;
  final String userid;
  final String videoUrl;
  final String thumbnailUrl;
  DateTime timestamp;
  final int upvote;
  final String markdowntext;
  final List tools;
  final List category;
  final List likedby;
  final bool isDraft;

  Post(
      {this.postid,
      this.title,
      this.shortdesc,
      this.tags,
      this.about,
      this.userid,
      this.videoUrl,
      this.thumbnailUrl,
      this.timestamp,
      this.upvote,
      this.markdowntext,
      this.category,
      this.likedby,
      this.tools,
      this.isDraft});

  factory Post.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();

    return Post(
      postid: doc.id,
      title: data['title'] ?? '',
      shortdesc: data['shortdesc'] ?? '',
      tags: data['tags'] ?? null,
      about: data['about'] ?? '',
      userid: data['userid'] ?? '',
      videoUrl: data['videourl'] ??
          'https://firebasestorage.googleapis.com/v0/b/skillshare-69b1f.appspot.com/o/defaults%2Fvideo.mp4?alt=media&token=102033f6-b5b8-4578-acb6-18103b2bae42',
      thumbnailUrl: data['thumbnailurl'] ??
          'https://firebasestorage.googleapis.com/v0/b/skillshare-69b1f.appspot.com/o/defaults%2Fdownload.png?alt=media&token=442cd51b-fd5a-477a-aebd-8af3599ae9a9',
      timestamp: data['timestamp'].toDate() ?? DateTime.now(),
      upvote: data['upvotes'] ?? 0,
      markdowntext: data['markdowntext'] ?? '',
      tools: data['tools'] ?? '',
      category: data['category'] ?? '',
      likedby: data['likedby'] ?? '',
      isDraft: data['isdraft'] ?? false,
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
      downvote: data['downvote'] ?? 0,
    );
  }
}

class Job {
  final String jobid;
  final String jobType;
  final String currency;
  final int salaryPackage;
  final String shortDesc;
  final String jobDescLink;
  final Geolocation jLocation;
  final List catagory;
  final List tags;
  final String webURL;
  final DateTime time;

  Job({
    this.jobid,
    this.jobType,
    this.currency,
    this.salaryPackage,
    this.shortDesc,
    this.jobDescLink,
    this.webURL,
    this.jLocation,
    this.catagory,
    this.tags,
    this.time,
  });

  factory Job.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();

    return Job(
      jobid: doc.id,
      jobType: data['jobtype'] ?? '',
      salaryPackage: data['salary'] ?? 0,
      currency: data['currency'] ?? 'INR',
      shortDesc: data['shortdesc'] ?? '',
      jobDescLink: data['jobdesclink'] ?? '',
      webURL: data['weburl'] ?? '',
      jLocation: data['jlocation'],
      catagory: data['category'] ?? '',
      tags: data['tags'],
      time: data['time'],
    );
  }
}

class BizAcc {
  final String accid;
  final String logoUrl;
  final String name;
  final String companyMailID;
  final String location;
  final String desciption;
  final String webURL;
  final String fbLink;
  final String instaLink;
  final String twitterLink;
  final String linkedinLink;
  final String userid;

  BizAcc({
    this.accid,
    this.logoUrl,
    this.name,
    this.companyMailID,
    this.location,
    this.desciption,
    this.fbLink,
    this.instaLink,
    this.linkedinLink,
    this.twitterLink,
    this.webURL,
    this.userid,
  });

  factory BizAcc.fromFirestore(DocumentSnapshot doc) {
    Map data = doc.data();

    return BizAcc(
      accid: doc.id,
      logoUrl: data['logourl'] ??
          'https://firebasestorage.googleapis.com/v0/b/skillshare-69b1f.appspot.com/o/defaults%2Fdownload.png?alt=media&token=442cd51b-fd5a-477a-aebd-8af3599ae9a9',
      name: data['name'] ?? '',
      companyMailID: data['mailid'] ?? '',
      location: data['location'] ?? '',
      desciption: data['description'] ?? '',
      fbLink: data['fblink'] ?? '',
      instaLink: data['instalink'] ?? '',
      linkedinLink: data['inLink'] ?? '',
      twitterLink: data['twitterlink'] ?? '',
      webURL: data['weburl'] ?? '',
      userid: data['userid'] ?? '',
    );
  }
}

class Docu {
  String name;
  Icon icon;

  Docu(this.name, this.icon);
}

class AddProjectForm {
  String title = '';
  String about = '';
  String markdowntext = '';
  String tags = '';
  String tools = '';
  String catagory = '';
}
