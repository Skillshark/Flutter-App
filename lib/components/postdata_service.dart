import 'package:cloud_firestore/cloud_firestore.dart';

class PostdataService {
  Future<void> postCreate(
      String postid, String title, List tags, String bio, String userid) async {
    CollectionReference post = FirebaseFirestore.instance.collection('posts');
    post.doc(postid).set({
      'title': title,
      'tags': tags.map((e) {
        return e.toMap();
      }).toList(),
      'bio': bio,
      'userid': userid,
      'videourl': '',
      'thumbnailurl': '',
      'timestamp': DateTime.now()
    });
  }

  Future<void> postEdit(String postid, String title, List tags, String bio,
      String userid, String videoUrl, String thumbnailUrl) async {
    CollectionReference post = FirebaseFirestore.instance.collection('users');
    post.doc(postid).update({
      'title': title,
      'tags': tags.map((e) {
        return e.toMap();
      }).toList(),
      'bio': bio,
      'usderid': userid,
      'videourl': videoUrl,
      'thumbnail': thumbnailUrl
    });
  }
}
