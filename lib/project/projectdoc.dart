import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skillshark/components/db_service.dart';
import 'package:skillshark/components/models.dart';
import 'package:skillshark/controller/pagecon.dart';
import 'package:skillshark/project/tab/wid/record.dart';

class Prodoc extends StatefulWidget {
  final String postid;

  Prodoc({Key key, this.postid}) : super(key: key);

  @override
  _ProdocState createState() => _ProdocState();
}

class _ProdocState extends State<Prodoc> {
  Size size;
  ScrollController scrollController = ScrollController();
  ScrollController top = ScrollController();
  ScrollController bottom = ScrollController();
  Pagecontrol pp;
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    pp = Provider.of<Pagecontrol>(context);
    return Scaffold(
      body: StreamBuilder<Post>(
          stream: DatabaseService().getPost(widget.postid),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Scrollbar(
                  controller: scrollController,
                  hoverThickness: 2,
                  child: ListView(
                    controller: scrollController,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      Card(
                        child: Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                snapshot.data.title,
                                style: GoogleFonts.roboto(
                                    fontSize: 18, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Lorem ipsum dolor sit amet, consectetuer adipiscing elit. Aenean commodo ligula eget dolor. Aenean massa. Cum sociis natoque penatibus et magnis dis',
                                style: GoogleFonts.roboto(fontSize: 13),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Row(
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        pp.project.Author,
                                        style: GoogleFonts.roboto(
                                            fontSize: 14,
                                            color: Colors.blue[900]),
                                      ),
                                      SizedBox(
                                        height: 2,
                                      ),
                                      Text(
                                        ' GPS Technology Specialist',
                                        style: GoogleFonts.roboto(
                                            fontSize: 12, color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                  Expanded(
                                    child: Container(),
                                  ),
                                  Icon(
                                    Icons.thumb_up,
                                    color: Colors.blue,
                                    size: 17,
                                  ),
                                  SizedBox(
                                    width: 2,
                                  ),
                                  Text(
                                    '50',
                                    style: TextStyle(color: Colors.blue),
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.share,
                                    size: 17,
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.save,
                                    size: 17,
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Documentary',
                        style: GoogleFonts.lato(
                            fontSize: 22,
                            fontWeight: FontWeight.w800,
                            color: Colors.blue[800]),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      MarkdownBody(data: snapshot.data.markdowntext),
                      SizedBox(
                        height: 30,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                                color: Colors.blue.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(10)),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text('Back to Top',
                                  style:
                                      GoogleFonts.roboto(color: Colors.blue)),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Widget title(String s) {
    return Text(
      s,
      style: GoogleFonts.roboto(
        fontSize: 20,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Widget content(String s) {
    return Text(
      s,
      style: GoogleFonts.roboto(fontSize: 16),
    );
  }
}
