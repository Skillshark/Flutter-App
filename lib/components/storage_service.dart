import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'dart:html';

import 'package:flutter_conditional_rendering/conditional_switch.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillshark/addproject/wid.dart';

class VidUploader extends StatefulWidget {
  final String postid;

  VidUploader({Key key, this.postid}) : super(key: key);

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
      });
    });
  }

  void upload() {
    final datetime = DateTime.now();
    final path = 'post_data/${widget.postid}/$datetime.mp4';
    uploadVid(onSelected: (file) {
      firebase_storage.UploadTask task =
          storage.ref().child(path).putBlob(file);

      task.then((_) async {
        String url = await firebase_storage.FirebaseStorage.instance
            .ref(path)
            .getDownloadURL();

        FirebaseFirestore.instance
            .collection('posts')
            .doc(widget.postid)
            .update({'videourl': url});
      });
      task.snapshotEvents.listen((snapshot) {
        percentUpload =
            (snapshot.bytesTransferred / snapshot.totalBytes) * 100 ?? 0;
      });
      task.whenComplete(() {
        taskbool = !taskbool;
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
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Upload Video',
                style: TextStyle(fontSize: 12.5),
              ),
              Icon(Icons.upload_file),
            ],
          ),
        ),
      );
    }
  }
}

class ThumbnailUpload extends StatefulWidget {
  final String postid;

  ThumbnailUpload({Key key, this.postid}) : super(key: key);

  @override
  _ThumbnailUploadState createState() => _ThumbnailUploadState();
}

class _ThumbnailUploadState extends State<ThumbnailUpload> {
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instanceFor(
          bucket: 'gs://skillshare-69b1f.appspot.com');

  double percentUpload;
  bool taskbool = false;

  void uploadVid({@required Function(File file) onSelected}) {
    InputElement uploadinp = FileUploadInputElement()..accept = 'image/*';
    uploadinp.click();

    uploadinp.onChange.listen((event) {
      final file = uploadinp.files.first;
      final reader = FileReader();
      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) {
        onSelected(file);
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
            .collection('posts')
            .doc(widget.postid)
            .update({'thumbnailurl': url});
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
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Upload Thumbnail',
                style: TextStyle(fontSize: 12.5),
              ),
              Icon(Icons.upload_file),
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
      });
    });
  }

  void upload() {
    final path = 'profile_picture/${widget.id}/dp.jpg';
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
      task.snapshotEvents.listen((snapshot) {
        percentUpload =
            (snapshot.bytesTransferred / snapshot.totalBytes) * 100 ?? 0;
      });
      task.whenComplete(() {
        taskbool = !taskbool;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    if (taskbool) {
      return Container(
        padding: EdgeInsets.all(5),
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

class LogoUploader extends StatefulWidget {
  final String bizaccid;

  const LogoUploader({Key key, this.bizaccid}) : super(key: key);

  @override
  _LogoUploaderState createState() => _LogoUploaderState();
}

class _LogoUploaderState extends State<LogoUploader> {
  double percentage;
  String path;
  UploadTask task;
  TaskSnapshot snapshot;

  uploadLogo(String bizaccid) async {
    InputElement uploadInput = FileUploadInputElement();
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final file = uploadInput.files.first;
      final reader = FileReader();

      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) async {
        uploadToFirebase(file, bizaccid);
      });
    });
  }

  uploadToFirebase(File imageFile, String bizaccid) async {
    final filePath = 'BizAcc/$bizaccid/logo.png';
    task = FirebaseStorage.instance.ref().child(filePath).putBlob(imageFile);
    task.snapshotEvents.listen((event) {
      percentage = event.bytesTransferred / event.bytesTransferred * 100;
    });
    task.then((_) async {
      String url =
          await FirebaseStorage.instance.ref().child(filePath).getDownloadURL();
      FirebaseFirestore.instance
          .collection('bizacc')
          .doc(bizaccid)
          .update({'logourl': url});
    });
    snapshot = await task;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          FlatButton(
            onPressed: () {
              uploadLogo(widget.bizaccid);
            },
            color: Colors.grey[200],
            child: Padding(
              padding: const EdgeInsets.all(3.0),
              child: Text('Choose File'),
            ),
          ),
          Container(
            height: 8,
            child: task != null
                ? ConditionalSwitch.single(
                    context: context,
                    valueBuilder: (BuildContext context) => snapshot.state,
                    caseBuilders: {
                      TaskState.running: (BuildContext context) =>
                          LinearProgressIndicator(
                            value: percentage,
                          ),
                      TaskState.success: (BuildContext context) =>
                          Text('Upload done'),
                      TaskState.error: (BuildContext context) => Text('error'),
                    },
                    fallbackBuilder: (BuildContext context) =>
                        SizedBox.shrink(),
                  )
                : SizedBox(
                    height: 8,
                  ),
          ),
        ],
      ),
    );
  }
}

class VideoUploader extends StatefulWidget {
  final String postid;

  VideoUploader({Key key, this.postid}) : super(key: key);

  @override
  _VideoUploaderState createState() => _VideoUploaderState();
}

class _VideoUploaderState extends State<VideoUploader> {
  String path;
  UploadTask task;
  TaskSnapshot snapshot;

  uploadVid(String postid) async {
    InputElement uploadInput = FileUploadInputElement();
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final file = uploadInput.files.first;
      final reader = FileReader();

      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) async {
        uploadToFirebase(file, postid);
      });
    });
  }

  uploadToFirebase(File vidFile, String postid) async {
    final filePath = 'post_data/$postid/vid.mp4';
    task = FirebaseStorage.instance.ref().child(filePath).putBlob(vidFile);
    setState(() {});

    task.then((_) async {
      String url =
          await FirebaseStorage.instance.ref().child(filePath).getDownloadURL();
      FirebaseFirestore.instance
          .collection('posts')
          .doc(postid)
          .update({'videourl': url});

      task = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          InkWell(
            onTap: () {
              uploadVid(widget.postid);
            },
            child: task == null
                ? Icon(
                    Icons.add_circle,
                    size: 50,
                    color: Colors.blue,
                  )
                : StreamBuilder<TaskSnapshot>(
                    stream: task.snapshotEvents,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(
                            value: snapshot.data.bytesTransferred /
                                snapshot.data.totalBytes,
                            backgroundColor: Colors.transparent,
                            color: Colors.green,
                          ),
                        );
                      } else {
                        return Center(
                          child: CircularProgressIndicator(
                            backgroundColor: Colors.transparent,
                            color: Colors.green,
                          ),
                        );
                      }
                    }),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            'Add More',
            style: GoogleFonts.roboto(fontSize: 12, color: Colors.blue),
          ),
        ],
      ),
    );
  }
}

class ThumbnailUploader extends StatefulWidget {
  final String postid;
  const ThumbnailUploader({Key key, this.postid}) : super(key: key);

  @override
  _ThumbnailUploaderState createState() => _ThumbnailUploaderState();
}

class _ThumbnailUploaderState extends State<ThumbnailUploader> {
  double percentage;
  String path;
  UploadTask task;
  TaskSnapshot snapshot;

  uploadImg(String postid) async {
    InputElement uploadInput = FileUploadInputElement();
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final file = uploadInput.files.first;
      final reader = FileReader();

      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) async {
        uploadToFirebase(file, postid);
      });
    });
  }

  uploadToFirebase(File imgFile, String postid) async {
    final filePath = 'post_data/$postid/vid.png';
    task = FirebaseStorage.instance.ref().child(filePath).putBlob(imgFile);
    task.snapshotEvents.listen((event) {
      percentage = event.bytesTransferred / event.bytesTransferred * 100;
    });
    task.then((_) async {
      String url =
          await FirebaseStorage.instance.ref().child(filePath).getDownloadURL();
      FirebaseFirestore.instance
          .collection('posts')
          .doc(postid)
          .update({'thumbnailurl': url});
    });
    snapshot = await task;
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      onPressed: () {
        uploadImg(widget.postid);
      },
      color: Colors.grey[400],
      child: Text('Choose File'),
    );
  }
}

class MarkdownUploader {
  UploadTask task;

  uploadToFirebase(String mkdown, String postid) async {
    final filePath = 'post_data/$postid/document.md';
    task = FirebaseStorage.instance.ref().child(filePath).putString(mkdown);

    task.then((_) async {
      String url =
          await FirebaseStorage.instance.ref().child(filePath).getDownloadURL();
      FirebaseFirestore.instance
          .collection('posts')
          .doc(postid)
          .update({'thumbnailurl': url});
    });
  }
}

class DPUploader extends StatefulWidget {
  final String userid;

  const DPUploader({Key key, this.userid}) : super(key: key);

  @override
  _DPUploaderState createState() => _DPUploaderState();
}

class _DPUploaderState extends State<DPUploader> {
  double percentage;
  String path;
  UploadTask task;
  TaskSnapshot snapshot;

  uploadImg(String userid) async {
    InputElement uploadInput = FileUploadInputElement();
    uploadInput.click();

    uploadInput.onChange.listen((event) {
      final file = uploadInput.files.first;
      final reader = FileReader();

      reader.readAsDataUrl(file);
      reader.onLoadEnd.listen((event) async {
        uploadToFirebase(file, userid);
      });
    });
  }

  uploadToFirebase(File imgFile, String userid) async {
    final filePath = 'profile_picture/$userid/dp.png';
    task = FirebaseStorage.instance.ref().child(filePath).putBlob(imgFile);
    task.snapshotEvents.listen((event) {
      percentage = event.bytesTransferred / event.bytesTransferred * 100;
    });
    task.then((_) async {
      String url =
          await FirebaseStorage.instance.ref().child(filePath).getDownloadURL();
      FirebaseFirestore.instance
          .collection('users')
          .doc(userid)
          .update({'dpurl': url});
    });
    snapshot = await task;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerLeft,
      height: 50,
      width: 200,
      child: Column(
        children: [
          RaisedButton(
            onPressed: () {
              uploadImg(widget.userid);
            },
            color: Colors.grey[400],
            child: Text('Change Photo'),
          ),
          SizedBox(
            height: 5,
          ),
          Container(
            child: task == null
                ? SizedBox()
                : StreamBuilder<TaskSnapshot>(
                    stream: task.snapshotEvents,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        return LinearProgressIndicator(
                          value: snapshot.data.totalBytes /
                              snapshot.data.bytesTransferred,
                        );
                      } else {
                        return SizedBox();
                      }
                    }),
          ),
        ],
      ),
    );
  }
}
