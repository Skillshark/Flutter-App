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
      'tags': empty.toList(),
      'bio': '',
      'upvotes': 0,
    });
  }

  Future<void> postEdit(
      String postid, String title, List tags, String bio) async {
    CollectionReference post = FirebaseFirestore.instance.collection('posts');
    post.doc(postid).update({
      'title': title,
      'tags': tags.map((e) {
        return e.toMap();
      }).toList(),
      'bio': bio,
    });
  }

  Future<void> createComment(String postid, String commentTxt, String userid) {
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
      await transaction.update(comment, {
        'upvotes': snap['upvotes'] + 1,
      });
    });
  }
}
