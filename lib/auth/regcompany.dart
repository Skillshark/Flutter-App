import 'dart:html';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillshark/component/wid.dart';
import 'package:skillshark/components/bi_client_service.dart';
import 'package:skillshark/components/db_service.dart';
import 'package:skillshark/components/models.dart';
import 'package:skillshark/components/storage_service.dart';
import 'package:uuid/uuid.dart';

class LogoSelect extends StatefulWidget {
  final String bizaccid;
  const LogoSelect({
    Key key,
    this.bizaccid,
  }) : super(key: key);

  @override
  _LogoSelectState createState() => _LogoSelectState();
}

class _LogoSelectState extends State<LogoSelect> {
  File file;

  Future<void> _pickImage() async {
    FilePickerResult result =
        await FilePicker.platform.pickFiles(type: FileType.image);
    var size = result.files.first.bytes;

    setState(() {
      file = File(size, result.files.single.path);
      LogoUploader().uploadTask(file, widget.bizaccid);
    });
  }

  void _clear() {
    setState(() {
      file = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: () async {
        await _pickImage();
      },
      color: Colors.grey[200],
      child: Padding(
        padding: const EdgeInsets.all(3.0),
        child: Text('Choose File'),
      ),
    );
  }
}

class Regc {
  BuildContext context;
  Size size;
  var name = TextEditingController();
  var mailId = TextEditingController();
  var cLocation = TextEditingController();
  var cDesc = TextEditingController();
  var cWebURL = TextEditingController();
  var cFb = TextEditingController();
  var cTwitter = TextEditingController();
  var cInsta = TextEditingController();
  var cLinkedin = TextEditingController();
  var user = FirebaseAuth.instance.currentUser;
  var uuid = Uuid().v1().toString();

  Regc(this.context, this.size);

  dia() {
    BiDataService().createBizAcc(uuid);
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return StreamBuilder<BizAcc>(
                stream: DatabaseService().streamBizAcc(uuid),
                builder: (context, snapshot) {
                  return SimpleDialog(
                    backgroundColor: Colors.white,
                    contentPadding: EdgeInsets.only(left: 20, right: 20),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    children: [
                      Container(
                        height: size.height - 100,
                        width: size.width - size.width / 5,
                        child: Row(
                          children: [
                            Expanded(
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 40,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: SizedBox(
                                        height: 70,
                                        child: Image.asset(
                                          'assets/images/login_page_logo.png',
                                          fit: BoxFit.contain,
                                        ),
                                      ),
                                    ),
                                    Expanded(flex: 1, child: Container()),
                                    pic(),
                                    Expanded(flex: 2, child: Container()),
                                  ],
                                ),
                              ),
                            ),
                            Row(
                              children: [],
                            ),
                            Expanded(
                              child: Container(
                                child: form(),
                              ),
                            ),
                            Expanded(
                              child: Container(
                                child: form2(),
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  );
                });
          });
        });
  }

  pic() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.only(left: 20),
          child: t('Company Logo'),
        ),
        SizedBox(
          height: 15,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            StreamBuilder<BizAcc>(
                stream: DatabaseService().streamBizAcc(uuid),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      height: 80,
                      width: 70,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(snapshot.data.logoUrl),
                          fit: BoxFit.cover,
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      height: 80,
                      width: 70,
                      color: Colors.grey[200],
                      child: Icon(
                        Icons.photo_size_select_actual_outlined,
                        size: 27,
                        color: Colors.grey[400],
                      ),
                    );
                  }
                }),
            SizedBox(
              width: 5,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    LogoSelect(
                      bizaccid: uuid,
                    ),
                    Text('  (or) Drag and Drop'),
                  ],
                  crossAxisAlignment: CrossAxisAlignment.start,
                ),
                Text(
                  'Supported File Formats: PNG',
                  style: TextStyle(color: Colors.grey, fontSize: 12),
                )
              ],
            )
          ],
        ),
      ],
    );
  }

  Widget form() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView(
        children: [
          SizedBox(
            height: 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AutoSizeText(
                'Register your company now!',
                style: GoogleFonts.roboto(fontSize: 18, color: Colors.black),
              ),
            ],
          ),
          SizedBox(
            height: 15,
          ),
          Text('Enter your information to setup a company account.',
              style: TextStyle(color: Colors.grey[400], fontSize: 14)),
          SizedBox(
            height: 30,
          ),
          SizedBox(
            height: 1,
          ),
          textfield('Company Name', name),
          SizedBox(
            height: 10,
          ),
          textfield('Company Mail ID', mailId),
          SizedBox(
            height: 1,
          ),
          textfield('Company Location', cLocation),
          SizedBox(
            height: 1,
          ),
          textfield('Short Description about your company', cDesc),
        ],
      ),
    );
  }

  Widget textfield(String s, var control) {
    return TextField(
      controller: control,
      decoration: InputDecoration(labelText: s),
    );
  }

  Widget form2() {
    return Padding(
      padding: const EdgeInsets.only(right: 35, left: 10),
      child: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Icon(Icons.clear),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 100,
          ),
          textfield('Company Web URL', cWebURL),
          SizedBox(
            height: 10,
          ),
          t('Social Media'),
          SizedBox(
            height: 1,
          ),
          textfield('Facebook', cFb),
          SizedBox(
            height: 1,
          ),
          textfield('Twitter', cTwitter),
          SizedBox(
            height: 1,
          ),
          textfield('Instagram', cInsta),
          SizedBox(
            height: 1,
          ),
          textfield('LinkedIn', cLinkedin),
          SizedBox(
            height: 40,
          ),
          ElevatedButton(
            onPressed: () {
              BiDataService().editBizAcc(
                  uuid,
                  name.text,
                  mailId.text,
                  cLocation.text,
                  cDesc.text,
                  cFb.text,
                  cInsta.text,
                  cLinkedin.text,
                  cTwitter.text,
                  cWebURL.text,
                  '');
            },
            child: Text('Get Started'),
          )
        ],
      ),
    );
  }
}
