import 'package:cloud_firestore/cloud_firestore.dart';

class PostdataService {
  Future<void> postCreate(String postid, String title, String userid) async {
    CollectionReference post = FirebaseFirestore.instance.collection('posts');
    post.doc(postid).set({
      'title': title,
      //'tags': [],
      'bio': '',
      'userid': userid,
      'videourl': '',
      'thumbnailurl': '',
      //'timestamp': DateTime.now(),
      'likes': 0,
    });
  }

  Future<void> postEdit(
      String postid, String title, List tags, String bio) async {
    CollectionReference post = FirebaseFirestore.instance.collection('users');
    post.doc(postid).update({
      'title': title,
      'tags': tags.map((e) {
        return e.toMap();
      }).toList(),
      'bio': bio,
    });
  }
}
