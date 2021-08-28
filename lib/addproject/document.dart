import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillshark/addproject/dialog/embed.dart';
import 'package:skillshark/addproject/dialog/style.dart';
import 'package:skillshark/components/models.dart';
import 'package:skillshark/components/postdata_service.dart';
import 'package:markdowneditor/markdowneditor.dart';

class Doc extends StatefulWidget {
  final String postid;

  Doc({Key key, this.postid}) : super(key: key);

  @override
  DocState createState() => DocState();
}

class DocState extends State<Doc> {
  List<Docu> dd = [
    Docu('Image', Icon(Icons.image_outlined)),
    Docu('Video', Icon(Icons.videocam_rounded)),
    Docu('Audio', Icon(Icons.music_note)),
    Docu('Embed', Icon(Icons.accessibility)),
    Docu('Styles', Icon(Icons.color_lens_outlined))
  ];
  var markdowncontroller = TextEditingController();
  Size size;

  submit() {
    if (markdowncontroller.text != null) {
      try {
        PostdataService().postEdit2(widget.postid, markdowncontroller.text);
      } finally {
        print('error');
      }
      return true;
    } else {
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Scrollbar(
        isAlwaysShown: true,
        child: ListView(
          children: [
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Container(
                  width: 120,
                  height: 70,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {},
                      child: Container(
                        width: 120,
                        height: 70,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                            boxShadow: [
                              BoxShadow(color: Colors.black, blurRadius: 1)
                            ]),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CircleAvatar(
                                radius: 14,
                                child: Text(
                                  'T',
                                  style: GoogleFonts.italiana(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                )),
                            SizedBox(
                              width: 4,
                            ),
                            Text(
                              'Text',
                              style: GoogleFonts.roboto(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Container(
                    height: 70,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: dd.map((e) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: InkWell(
                            onTap: () {
                              dia(context, e);
                            },
                            child: Container(
                              width: 120,
                              height: 70,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.grey[300]),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  e.icon,
                                  SizedBox(
                                    width: 4,
                                  ),
                                  Text(e.name)
                                ],
                              ),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              height: 400,
              child: Markeditor(
                controller: markdowncontroller,
                size: size,
              ),
            ),
            SizedBox(
              height: 15,
            ),
          ],
        ),
      ),
    );
  }

  dia(BuildContext context, Docu ddd) {
    if (ddd.name == 'Embed') {
      Embed(context).dia();
    } else if (ddd.name == 'Styles') {
      Stly(context).dia();
    }
  }
}
