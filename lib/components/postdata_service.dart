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
      'likedby': empty,
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
      'upvoteusers': upvoteUsers,
      'downvoteusers': downvoteUsers,
    });
  }

  Future<void> commentUpvote(
      var postid, var commentid, bool selected, var userid) {
    DocumentReference comment = FirebaseFirestore.instance
        .collection('posts')
        .doc(postid)
        .collection('comments')
        .doc(commentid);

    List<String> user = [userid];

    if (selected) {
      FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot snap = await transaction.get(comment);
        transaction.update(comment, {
          'upvote': snap['upvote'] + 1,
        });
      });
      comment.update({'upvoteusers': FieldValue.arrayUnion(user)});
    } else {
      FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot snap = await transaction.get(comment);
        transaction.update(comment, {
          'upvote': snap['upvote'] - 1,
        });
      });
      comment.update({'upvoteusers': FieldValue.arrayRemove(user)});
    }
  }

  Future<void> commentDownvote(
      var postid, var commentid, bool selected, var userid) {
    DocumentReference comment = FirebaseFirestore.instance
        .collection('posts')
        .doc(postid)
        .collection('comments')
        .doc(commentid);

    List<String> user = [userid];

    if (selected) {
      FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot snap = await transaction.get(comment);
        transaction.update(comment, {
          'downvote': snap['downvote'] + 1,
        });
      });
      comment.update({'downvoteusers': FieldValue.arrayUnion(user)});
    } else {
      FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot snap = await transaction.get(comment);
        transaction.update(comment, {
          'downvote': snap['downvote'] - 1,
        });
      });
      comment.update({'downvoteusers': FieldValue.arrayRemove(user)});
    }
  }

  Future<void> postLike(var postid, bool selected, var userid) {
    DocumentReference comment =
        FirebaseFirestore.instance.collection('posts').doc(postid);

    List<String> user = [userid];

    if (selected) {
      FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot snap = await transaction.get(comment);
        transaction.update(comment, {
          'likes': snap['likes'] + 1,
        });
      });
      comment.update({'downvoteusers': FieldValue.arrayUnion(user)});
    } else {
      FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot snap = await transaction.get(comment);
        transaction.update(comment, {
          'likes': snap['likes'] - 1,
        });
      });
      comment.update({'downvoteusers': FieldValue.arrayRemove(user)});
    }
  }
}
