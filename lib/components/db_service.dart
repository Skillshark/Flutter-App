import 'package:cloud_firestore/cloud_firestore.dart';
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
}
