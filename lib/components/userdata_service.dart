import 'package:cloud_firestore/cloud_firestore.dart';

class UserdataService {
  Future<void> userCreate(String uid, String inpname) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    users.doc(uid).set({
      'name': inpname,
      'linkedin': '',
      'github': '',
      'dpurl': '',
    });
  }

  Future<void> userEdit(String uid, String inpname, String linkedinlink,
      String githublink, String dpurl) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');
    users.doc(uid).update({
      'name': inpname,
      'linkedin': linkedinlink,
      'githublink': githublink,
      'dpurl': dpurl,
    });
  }
}
