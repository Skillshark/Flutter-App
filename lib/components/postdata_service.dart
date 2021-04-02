import 'package:cloud_firestore/cloud_firestore.dart';

class PostdataService {
  Future<void> postCreate(
      String postid, String title, List tags, String bio, String userid) async {
    CollectionReference users = FirebaseFirestore.instance.collection('posts');
    users.doc(postid).set({
      'title': title,
      'tags': tags.map((e) {
        return e.toMap();
      }).toList(),
      'bio': bio,
      'userid': userid,
      //'videoUrl': videoUrl,
    });
  }

  Future<void> postEdit(
      String postid, String title, List tags, String bio, String userid) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    users.doc(postid).update({
      'title': title,
      'tags': tags.map((e) {
        return e.toMap();
      }).toList(),
      'bio': bio,
      'usderid': userid,
    });
  }
}
