import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

class PostdataService {
  Future<void> postCreate(String postid, String userid) async {
    List<String> empty = [];
    CollectionReference post = FirebaseFirestore.instance.collection('posts');
    post.doc(postid).set({
      'title': '',
      'userid': userid,
      'videourl': '',
      'thumbnailurl': '',
      'timestamp': FieldValue.serverTimestamp(),
      'tags': empty,
      'about': '',
      'upvotes': 0,
      'likedby': empty,
      'markdowntext': '',
      'tools': empty,
      'category': empty
    });
  }

  Future<void> postEdit1(
    String postid,
    String title,
    String about,
  ) async {
    CollectionReference post = FirebaseFirestore.instance.collection('posts');
    post.doc(postid).update({
      'title': title,
      'about': about,
    });
  }

  Future<void> postEdit2(String postid, String markdowntext) async {
    CollectionReference post = FirebaseFirestore.instance.collection('posts');
    post.doc(postid).update({
      'markdowntext': markdowntext,
    });
  }

  Future<void> postEdit3(String postid, List<String> tags, List<String> tools,
      List<String> category) async {
    CollectionReference post = FirebaseFirestore.instance.collection('posts');
    post.doc(postid).update({
      'tags': tags,
      'tools': tools,
      'category': category,
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
    DocumentReference post =
        FirebaseFirestore.instance.collection('posts').doc(postid);

    List<String> user = [userid];

    if (selected) {
      FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot snap = await transaction.get(post);
        transaction.update(post, {
          'likes': snap['likes'] + 1,
        });
      });
      post.update({'downvoteusers': FieldValue.arrayUnion(user)});
    } else {
      FirebaseFirestore.instance.runTransaction((transaction) async {
        DocumentSnapshot snap = await transaction.get(post);
        transaction.update(post, {
          'likes': snap['likes'] - 1,
        });
      });
      post.update({'downvoteusers': FieldValue.arrayRemove(user)});
    }
  }
}
