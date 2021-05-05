import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class PostdataService {
  Future<void> postCreate(String postid, String title, String userid) async {
    List<String> empty = [];
    CollectionReference post = FirebaseFirestore.instance.collection('posts');
    post.doc(postid).set({
      'title': title,
      'userid': userid,
      'videourl': '',
      'thumbnailurl': '',
      'timestamp': FieldValue.serverTimestamp(),
      'tags': empty,
      'bio': '',
      'upvotes': 0,
    });
  }

  Future<void> postEdit(
      String postid, String title, List<String> tags, String bio) async {
    CollectionReference post = FirebaseFirestore.instance.collection('posts');
    post.doc(postid).update({
      'title': title,
      'tags': tags,
      'bio': bio,
    });
  }

  Future<void> createComment(String postid, String commentTxt, String userid) {
    List<String> upvoteUsers = [];
    List<String> downvoteUsers = [];

    CollectionReference comment = FirebaseFirestore.instance
        .collection('posts')
        .doc(postid)
        .collection('comments');
    comment.add({
      'userid': userid,
      'commentTxt': commentTxt,
      'timestamp': FieldValue.serverTimestamp(),
      'upvote': 0,
      'downvote': 0,
      'upvoteeser': upvoteUsers,
      'downvoteusers': downvoteUsers,
    });
  }

  Future<void> commentLike(var postid, var commentid) {
    DocumentReference comment = FirebaseFirestore.instance
        .collection('posts')
        .doc(postid)
        .collection('comments')
        .doc(commentid);

    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snap = await transaction.get(comment);
      transaction.update(comment, {
        'upvotes': snap['upvotes'] + 1,
      });
    });
  }

  Future<void> commentUpvote(var postid, var commentid) {
    DocumentReference comment = FirebaseFirestore.instance
        .collection('posts')
        .doc(postid)
        .collection('comments')
        .doc(commentid);

    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snap = await transaction.get(comment);
      transaction.update(comment, {
        'upvote': snap['upvote'] + 1,
      });
    });
  }

  Future<void> commentDownvote(var postid, var commentid) {
    DocumentReference comment = FirebaseFirestore.instance
        .collection('posts')
        .doc(postid)
        .collection('comments')
        .doc(commentid);

    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snap = await transaction.get(comment);
      transaction.update(comment, {
        'downvote': snap['downvote'] + 1,
      });
    });
  }

  Future<void> postLike(var postid) {
    DocumentReference comment =
        FirebaseFirestore.instance.collection('posts').doc(postid);

    FirebaseFirestore.instance.runTransaction((transaction) async {
      DocumentSnapshot snap = await transaction.get(comment);
      transaction.update(comment, {
        'upvotes': snap['upvotes'] + 1,
      });
    });
  }
}
