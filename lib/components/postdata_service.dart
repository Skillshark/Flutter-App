import 'package:cloud_firestore/cloud_firestore.dart';

class PostdataService {
  Future<void> postCreate(String postid, String title, String userid) async {
    List empty = [];
    CollectionReference post = FirebaseFirestore.instance.collection('posts');
    post.doc(postid).set({
      'title': title,
      'userid': userid,
      'videourl': '',
      'thumbnailurl': '',
      'timestamp': FieldValue.serverTimestamp(),
      'tags': empty.map((e) {
        return e.toMap();
      }).toList(),
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
    });
  }
}
