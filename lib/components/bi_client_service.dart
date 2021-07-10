import 'dart:html';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';

class BiDataService {
  Future<void> createJob(String jobid) async {
    CollectionReference jobs = FirebaseFirestore.instance.collection('jobs');

    await jobs.doc(jobid).set({
      'jobtype': '',
      'salary': 0,
      'currency': '',
      'shortdesc': '',
      'jobdesclink': '',
      'weburl': '',
      'jlocation': '',
      'catagory': '',
      'tags': null,
      'time': DateTime.now(),
    });
  }

  Future<void> editJob(
      String jobid,
      String jobtype,
      int salary,
      String currency,
      String shortdec,
      String jobdesclink,
      String weburl,
      Geolocation jlocation,
      String catagory,
      List tags,
      DateTime time) async {
    CollectionReference jobs = FirebaseFirestore.instance.collection('jobs');

    await jobs.doc(jobid).update({
      'jobtype': jobtype,
      'salary': salary,
      'currency': currency,
      'shortdesc': shortdec,
      'jobdesclink': jobdesclink,
      'weburl': weburl,
      'jlocation': jlocation,
      'catagory': catagory,
      'tags': tags,
      'time': time,
    });
  }

  Future<void> createBizAcc(
    String bizaccid,
  ) {
    CollectionReference bizAcc =
        FirebaseFirestore.instance.collection('bizacc');

    bizAcc.doc(bizaccid).set({
      'logourl':
          'https://firebasestorage.googleapis.com/v0/b/skillshare-69b1f.appspot.com/o/defaults%2Fdownload.png?alt=media&token=442cd51b-fd5a-477a-aebd-8af3599ae9a9',
      'name': '',
      'mailid': '',
      'location': '',
      'description': '',
      'fblink': '',
      'instalink': '',
      'inLink': '',
      'twitterlink': '',
      'weburl': '',
      'userid': '',
    });
  }

  Future<void> editBizAcc(
    String bizaccid,
    String name,
    String mailid,
    String location,
    String description,
    String fblink,
    String insta,
    String linkedin,
    String twitter,
    String weburl,
    String userid,
  ) {
    CollectionReference bizAcc =
        FirebaseFirestore.instance.collection('bizacc');

    bizAcc.doc(bizaccid).update({
      'name': name,
      'mailid': mailid,
      'location': location,
      'description': description,
      'fblink': fblink,
      'instalink': insta,
      'inLink': linkedin,
      'twitterlink': twitter,
      'weburl': weburl,
      'userid': userid,
    });
  }
}
