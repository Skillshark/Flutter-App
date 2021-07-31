import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillshark/addproject/wid.dart';

class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    text('Category'),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      'Project Cover Image',
                      style: GoogleFonts.roboto(
                          fontSize: 18, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10, right: 8),
                      child: DottedBorder(
                        color: Colors.grey[600],
                        strokeWidth: 1,
                        child: Container(
                          height: 220,
                          width: 250,
                          decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.image_outlined,
                                    size: 60,
                                    color: Colors.grey[400],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Icon(
                                    Icons.videocam_rounded,
                                    size: 60,
                                    color: Colors.grey[400],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text(
                                'Image or GIF',
                                style: GoogleFonts.roboto(
                                    fontSize: 12, color: Colors.grey[400]),
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              Text('Minimum size 808 by 632 px',
                                  style: GoogleFonts.roboto(
                                      fontSize: 12, color: Colors.grey[400])),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Text('Add Team and Team Members',
                        style: GoogleFonts.roboto(
                            fontSize: 14, color: Colors.blue))
                  ],
                ),
              )),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Container(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    tex('Tags'),
                    SizedBox(
                      height: 10,
                    ),
                    fields('Add Tags'),
                    SizedBox(
                      height: 10,
                    ),
                    //add tags leta
                    Text(
                        'Tags are publicly shared details about your content \n that let others discover you more easily',
                        style: GoogleFonts.roboto(
                            fontSize: 12, color: Colors.grey[400])),
                    SizedBox(
                      height: 30,
                    ),
                    tex('Tools & Resources'),
                    SizedBox(
                      height: 10,
                    ),
                    fields('Software, Hardware, Materials used for project'),
                    SizedBox(
                      height: 30,
                    ),
                    tex('Categorize'),
                    SizedBox(
                      height: 10,
                    ),
                    fieldicon('Software, Hardware, Materials used for project'),
                    SizedBox(
                      height: 30,
                    ),
                    tex('Social Media Links'),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Facebook'),
                    SizedBox(
                      height: 10,
                    ),
                    fields(''),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Facebook'),
                    SizedBox(
                      height: 10,
                    ),
                    fields(''),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Instagram'),
                    SizedBox(
                      height: 10,
                    ),
                    fields(''),
                    SizedBox(
                      height: 20,
                    ),
                    Text('Twitter'),
                    SizedBox(
                      height: 10,
                    ),
                    fields(''),
                    Text('Linked In'),
                    SizedBox(
                      height: 10,
                    ),
                    fields(''),
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        OutlineButton(
                          onPressed: () {},
                          child: Text('Preview'),
                        ),
                      ],
                    )
                  ],
                ),
              )),
            ],
          ),
        ],
      ),
    );
  }
}
