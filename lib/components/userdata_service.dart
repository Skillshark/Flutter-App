import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/cupertino.dart';
import 'package:skillshark/components/db_service.dart';
import 'package:skillshark/components/models.dart';

class UserdataService {
  Future<void> userCreate(String uid, String inpname) async {
    String defaultDPURL = await firebase_storage.FirebaseStorage.instance
        .ref('defaults/defalt.jpg')
        .getDownloadURL();

    CollectionReference users = FirebaseFirestore.instance.collection('users');
    await users.doc(uid).set({
      'name': inpname ?? '',
      'linkedin': '',
      'github': '',
      'dpurl': defaultDPURL,
    });
  }

  Future<void> userEdit(String uid, String inpname, String linkedinlink,
      String githublink) async {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    users.doc(uid).update({
      'name': inpname,
      'linkedin': linkedinlink,
      'github': githublink,
    });
  }
}
