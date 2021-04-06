import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:html';

class VidUploader extends StatefulWidget {
  final File file;
  final String postid;

  VidUploader({Key key, this.file, this.postid}) : super(key: key);

  @override
  _VidUploaderState createState() => _VidUploaderState();
}

class _VidUploaderState extends State<VidUploader> {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instanceFor(
          bucket: 'gs://skillshare-69b1f.appspot.com');

  double percentUpload;
  bool taskbool = false;

  void uploadVid({@required Function(File file) onSelected}) {
    InputElement uploadinp = FileUploadInputElement()..accept = 'video/*';
    uploadinp.click();

    uploadinp.onChange.listen((event) {
      final file = uploadinp.files.first;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) {
        onSelected(file);
        taskbool = false;
      });
    });
  }

  void upload() {
    final datetime = DateTime.now();
    final path = 'post_data/${widget.postid}/$datetime.jpg';
    uploadVid(onSelected: (file) {
      firebase_storage.UploadTask task =
          storage.ref().child(path).putBlob(file);
      task.then((_) async {
        String url = await firebase_storage.FirebaseStorage.instance
            .ref(path)
            .getDownloadURL();

        FirebaseFirestore.instance
            .collection('post')
            .doc(widget.postid)
            .update({'videourl': url});
      });
      setState(() {
        taskbool = task != null ? true : false;
      });
      task.snapshotEvents.listen((snapshot) {
        percentUpload =
            (snapshot.bytesTransferred / snapshot.totalBytes) * 100 ?? 0;
      });
      task.whenComplete(() {
        taskbool = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (taskbool) {
      return Container(
        child: CircularProgressIndicator(
          value: percentUpload,
        ),
      );
    } else {
      return InkWell(
        onTap: () {
          upload();
        },
        child: Container(
          child: Row(
            children: [
              Text(
                'Uppload Video',
                style: TextStyle(fontSize: 12.5),
              ),
              Icon(Icons.edit),
            ],
          ),
        ),
      );
    }
  }
}

class DPUpload extends StatefulWidget {
  final String id;

  DPUpload({Key key, this.id}) : super(key: key);

  @override
  _DPUploadState createState() => _DPUploadState();
}

class _DPUploadState extends State<DPUpload> {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instanceFor(
          bucket: 'gs://skillshare-69b1f.appspot.com');

  double percentUpload;
  bool taskbool = false;

  void uploadImg({@required Function(File file) onSelected}) {
    InputElement uploadinp = FileUploadInputElement()..accept = 'image/*';
    uploadinp.click();

    uploadinp.onChange.listen((event) {
      final file = uploadinp.files.first;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) {
        onSelected(file);
        taskbool = false;
      });
    });
  }

  void upload() {
    final datetime = DateTime.now();
    final path = 'profile_picture/${widget.id}/$datetime.jpg';
    uploadImg(onSelected: (file) {
      firebase_storage.UploadTask task =
          storage.ref().child(path).putBlob(file);
      task.then((_) async {
        String url = await firebase_storage.FirebaseStorage.instance
            .ref(path)
            .getDownloadURL();

        FirebaseFirestore.instance
            .collection('users')
            .doc(widget.id)
            .update({'dpurl': url});
      });
      setState(() {
        taskbool = task != null ? true : false;
      });
      task.snapshotEvents.listen((snapshot) {
        percentUpload =
            (snapshot.bytesTransferred / snapshot.totalBytes) * 100 ?? 0;
      });
      task.whenComplete(() {
        taskbool = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (taskbool) {
      return Container(
        padding: EdgeInsets.all(2),
        child: CircularProgressIndicator(
          value: percentUpload,
        ),
      );
    } else {
      return InkWell(
        onTap: () {
          upload();
        },
        child: Container(
          child: Icon(
            Icons.edit,
          ),
        ),
      );
    }
  }
}
