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

  Stream<Post> getPost(var postid) {
    return _db
        .collection('posts')
        .doc(postid)
        .snapshots()
        .map((event) => Post.fromFirestore(event));
  }

  Stream<List<Post>> streamPost() {
    var ref = _db.collection('posts');

    return ref.snapshots().map(
        (list) => list.docs.map((doc) => Post.fromFirestore(doc)).toList());
  }

  Stream<List<Post>> streamProfilePost(var userid) {
    var ref = _db.collection('posts');

    return ref.where('userid', isEqualTo: userid).snapshots().map(
        (list) => list.docs.map((doc) => Post.fromFirestore(doc)).toList());
  }

  Stream<Comment> getComment(var postid, var commentid) {
    return _db
        .collection('posts')
        .doc(postid)
        .collection('comments')
        .doc(commentid)
        .snapshots()
        .map((event) => Comment.fromFirestore(event));
  }

  Stream<List<Comment>> streamComment(var postid) {
    var ref = _db.collection('posts').doc(postid).collection('comments');

    return ref.snapshots().map(
        (list) => list.docs.map((doc) => Comment.fromFirestore(doc)).toList());
  }
}
