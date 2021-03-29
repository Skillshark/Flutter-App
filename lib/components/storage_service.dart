import 'dart:io';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;

class VidUploader extends StatefulWidget {
  final File file;
  final String postid;

  VidUploader({Key key, this.file, this.postid}) : super(key: key);

  @override
  _VidUploaderState createState() => _VidUploaderState();
}

class _VidUploaderState extends State<VidUploader> {
  double percentUpload;
  bool taskbool;

  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instanceFor(
          bucket: 'gs://skillshare-69b1f.appspot.com');

  Future<void> uploadVideo() async {
    String filePath = '/videos/${widget.postid}.mp4';
    firebase_storage.UploadTask task =
        storage.ref().child(filePath).putFile(widget.file);
    task.snapshotEvents.listen((firebase_storage.TaskSnapshot snapshot) {
      percentUpload =
          (snapshot.bytesTransferred / snapshot.totalBytes) * 100 ?? 0;
      print('${snapshot.state}');
    }, onError: (e) {
      print(e.toString());
    });
  }

  @override
  Widget build(BuildContext context) {}
}

class DPUpload extends StatefulWidget {
  final File file;
  final String id;

  DPUpload({Key key, this.file, this.id}) : super(key: key);

  @override
  _DPUploadState createState() => _DPUploadState();
}

class _DPUploadState extends State<DPUpload> {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instanceFor(
          bucket: 'gs://skillshare-69b1f.appspot.com');

  firebase_storage.UploadTask _uploadTask;

  void _startUpload() {
    String filePath = '/displaypictures/${widget.id}.jpg';

    setState(() {
      _uploadTask = storage.ref().child(filePath).putFile(widget.file);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (_uploadTask != null) {
      return StreamBuilder(
          stream: _uploadTask.snapshotEvents,
          builder: (context, snapshot) {
            var event = snapshot?.data?.snapshot;

            double progresspercent = event != null
                ? event.bytesTransferred / event.totalByteCount
                : 0;
            return Container(
              child: CircularProgressIndicator(
                value: progresspercent,
              ),
            );
          });
    } else {
      return InkWell(
        onTap: _startUpload,
        child: Container(
          child: Icon(Icons.edit),
        ),
      );
    }
  }
}
