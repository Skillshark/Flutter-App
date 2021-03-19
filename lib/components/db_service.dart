import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:skillshark/components/post.dart';
import 'models.dart';

class DatabaseService {
  final FirebaseFirestore _db = FirebaseFirestore.instance;

  Stream<Usr> getUser(String uid) {
    return _db
        .collection('users')
        .doc(uid)
        .snapshots()
        .map((event) => Usr.fromFirestore(event));
  }

  Stream<Post> getPost(String postid) {
    return _db
        .collection('post')
        .doc(postid)
        .snapshots()
        .map((event) => Post.fromFirestore(event));
  }

  Stream<List<Post>> streamPost() {
    var ref = _db.collection('post');

    return ref
        .snapshots()
        .map((list) => list.docs.map((doc) => Post.fromFirestore(doc)));
  }
}
