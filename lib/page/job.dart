import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillshark/component/cart.dart';
import 'package:skillshark/component/head.dart';
import 'package:skillshark/component/search.dart';
import 'package:skillshark/job/component/jobcard.dart';
import 'package:skillshark/job/postjob.dart';
import 'package:skillshark/job/search.dart';
import 'package:skillshark/model/jobm.dart';

bool postjob = false;

class Job extends StatefulWidget {
  @override
  _JobState createState() => _JobState();
}

class _JobState extends State<Job> {
  Size size;
  List j = [
    'UX UI Designer',
    'Remote Jobs',
    'Fashion Desogner',
    'Freshers Job'
  ];

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Head(size),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  AutoSizeText(
                    'Search Jobs by Categories',
                    style: GoogleFonts.lato(
                        fontSize: 20,
                        color: Colors.blue[700],
                        fontWeight: FontWeight.bold),
                    maxLines: 2,
                  ),
                  ElevatedButton.icon(
                      onPressed: () {
                        setState(() {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => PostJob()));
                        });
                      },
                      icon: Icon(Icons.post_add),
                      label: Text(
                        'Post a Job',
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Cart(size, context),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [jSearchbar(size)],
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Container(
                height: 48,
                child: Row(
                  children: [
                    Text(
                      'Tags',
                      style: GoogleFonts.lato(
                        fontSize: 15,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                        child: Container(
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: j.map((e) {
                          return Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Container(
                              height: 58,
                              width: 150,
                              color: Colors.grey[300],
                              child: Center(
                                  child: Row(
                                children: [
                                  Expanded(child: Container()),
                                  Text(e),
                                  Expanded(child: Container()),
                                  Icon(
                                    Icons.clear,
                                    size: 13,
                                  ),
                                  Expanded(child: Container()),
                                ],
                              )),
                            ),
                          );
                        }).toList(),
                      ),
                    )),
                    OutlineButton.icon(
                        onPressed: () {},
                        color: Colors.black,
                        icon: Icon(Icons.add_circle),
                        label: Text('Add Tags'))
                  ],
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: Row(
                children: [
                  //Based on your interests
                  Text(
                    'Recommended Jobs',
                    style: GoogleFonts.lato(
                      fontSize: 32,
                      color: Colors.blue,
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Showing 864 results',
                    style: GoogleFonts.lato(
                      fontSize: 15,
                      color: Colors.grey,
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 50, right: 50),
              child: GridView(
                physics: NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 300,
                  mainAxisSpacing: 10,
                  childAspectRatio: 4 / 4.5,
                  crossAxisSpacing: 10,
                ),
                shrinkWrap: true,
                children: jlist
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(13.0),
                          child: jobcard(size, e, context),
                        ))
                    .toList(),
              ),
            )
          ],
        ),
      ),
    );
  }
}
