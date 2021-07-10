import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillshark/global/global.dart';
import 'package:skillshark/model/jobm.dart';

class Apply {
  BuildContext context;
  Size size;
  Jobm j;

  Apply(this.size, this.context, this.j);

  dial() {
    showCupertinoDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            insetPadding: EdgeInsets.only(left: 20, right: 20),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            children: [
              Container(
                height: size.height - 100,
                width: size.width - size.width / 5,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(child: Container()),
                        Text(
                          'Job Details',
                          style: GoogleFonts.lato(
                              fontSize: 16, color: Colors.blue),
                        ),
                        Expanded(child: Container()),
                        InkWell(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Icon(Icons.clear),
                          ),
                          onTap: () {
                            Navigator.pop(context);
                          },
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: ListTile(
                              leading: Image.asset(j.avatar),
                              title: Text(
                                j.tite,
                                style: GoogleFonts.lato(
                                    fontSize: 20, color: Colors.black),
                              ),
                              subtitle: Text(
                                j.Author,
                                style: GoogleFonts.lato(
                                    fontSize: 16, color: Colors.blue),
                              ),
                            ),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.share,
                              color: Colors.blueAccent,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.save,
                              color: Colors.blueAccent,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Icon(
                              Icons.more_vert_sharp,
                              color: Colors.blueAccent,
                            ),
                            SizedBox(
                              width: 5,
                            )
                          ],
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: ElevatedButton(
                          onPressed: () {},
                          child: SizedBox(
                            width: 150,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Center(child: Text('Apply Now')),
                            ),
                          )),
                    ),
                    Expanded(
                        child: Container(
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                  child: ListView(
                                    children: [
                                      Text(
                                        'Job Description:',
                                        style: GoogleFonts.lato(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          child: Text(
                                        g,
                                        style: GoogleFonts.lato(
                                            fontSize: 13, color: Colors.black),
                                      )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'About Us:',
                                        style: GoogleFonts.lato(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                          child: Text(
                                        d,
                                        style: GoogleFonts.lato(
                                            fontSize: 13, color: Colors.black),
                                      )),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        'Benefits:',
                                        style: GoogleFonts.lato(
                                            fontSize: 16, color: Colors.black),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      ListView(
                                        shrinkWrap: true,
                                        physics: NeverScrollableScrollPhysics(),
                                        children: ben.map((e) {
                                          return Padding(
                                            padding: const EdgeInsets.all(5.0),
                                            child: Row(
                                              children: [
                                                CircleAvatar(
                                                  radius: 5,
                                                  backgroundColor: Colors.black,
                                                ),
                                                SizedBox(
                                                  width: 10,
                                                ),
                                                Text(
                                                  e,
                                                  style: GoogleFonts.lato(
                                                      fontSize: 13,
                                                      color: Colors.black),
                                                ),
                                              ],
                                            ),
                                          );
                                        }).toList(),
                                      ),
                                      Text(
                                        'Company Details',
                                        style: GoogleFonts.lato(
                                            fontSize: 16, color: Colors.blue),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 0, top: 5, bottom: 5),
                                        child: Text(
                                          j.Author,
                                          style: GoogleFonts.lato(
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 0, top: 5, bottom: 5),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Web:',
                                              style: GoogleFonts.lato(
                                                  fontSize: 14,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              'www.Levis.com',
                                              style: GoogleFonts.lato(
                                                  fontSize: 14,
                                                  color: Colors.blue),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(
                                            left: 0, top: 5, bottom: 5),
                                        child: Row(
                                          children: [
                                            Text(
                                              'Mail:',
                                              style: GoogleFonts.lato(
                                                  fontSize: 14,
                                                  color: Colors.black),
                                            ),
                                            SizedBox(width: 5),
                                            Text(
                                              'mail@levis.com',
                                              style: GoogleFonts.lato(
                                                  fontSize: 14,
                                                  color: Colors.blue),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                          padding: const EdgeInsets.only(
                                              left: 0, top: 5, bottom: 5),
                                          child: Row(children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                  color: Colors.black54,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Icon(
                                                      FeatherIcons.facebook,
                                                      color: Colors.white,
                                                    ),
                                                  )),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                  color: Colors.black54,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Icon(
                                                      FeatherIcons.instagram,
                                                      color: Colors.white,
                                                    ),
                                                  )),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                  color: Colors.black54,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Icon(
                                                      FeatherIcons.linkedin,
                                                      color: Colors.white,
                                                    ),
                                                  )),
                                            ),
                                            Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Container(
                                                  color: Colors.black54,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: Icon(
                                                      FeatherIcons.twitter,
                                                      color: Colors.white,
                                                    ),
                                                  )),
                                            ),
                                          ]))
                                    ],
                                  ),
                                ),
                              )),
                          Expanded(
                              flex: 1,
                              child: Container(
                                child: ListView(
                                  children: [
                                    Text(
                                      'Know More',
                                      style: GoogleFonts.lato(
                                          fontSize: 13,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 15),
                                      child: Container(
                                        color: Colors.grey[300],
                                        height: 260,
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Location',
                                                style: GoogleFonts.lato(
                                                    fontSize: 12,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                'Onsite\nMumbai, India',
                                                style: GoogleFonts.lato(
                                                    fontSize: 12,
                                                    color: Colors.black),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                'Job Type',
                                                style: GoogleFonts.lato(
                                                    fontSize: 12,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                j.cart,
                                                style: GoogleFonts.lato(
                                                    fontSize: 12,
                                                    color: Colors.black),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                'Posted',
                                                style: GoogleFonts.lato(
                                                    fontSize: 12,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                j.date,
                                                style: GoogleFonts.lato(
                                                    fontSize: 12,
                                                    color: Colors.black),
                                              ),
                                              SizedBox(
                                                height: 15,
                                              ),
                                              Text(
                                                'Salary Package',
                                                style: GoogleFonts.lato(
                                                    fontSize: 12,
                                                    color: Colors.grey),
                                              ),
                                              SizedBox(
                                                height: 5,
                                              ),
                                              Text(
                                                '20K - 40K',
                                                style: GoogleFonts.lato(
                                                    fontSize: 12,
                                                    color: Colors.black),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Tag',
                                      style: GoogleFonts.lato(
                                          fontSize: 13,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 25),
                                      child: Container(
                                        height: 50,
                                        color: Colors.grey[300],
                                        child: Row(
                                          children: [
                                            Expanded(
                                              child: Container(
                                                child: SingleChildScrollView(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: j.list.map((el) {
                                                      return Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(3.0),
                                                        child: Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            color: Colors.white,
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                const EdgeInsets
                                                                    .all(4.0),
                                                            child: Text(
                                                              el,
                                                              style: TextStyle(
                                                                  fontSize: 11,
                                                                  color: Colors
                                                                      .black),
                                                            ),
                                                          ),
                                                        ),
                                                      );
                                                    }).toList(),
                                                  ),
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Text(
                                      'Other Jobs in this Company',
                                      style: GoogleFonts.lato(
                                          fontSize: 13,
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    SizedBox(
                                      height: 20,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(
                                          left: 5, right: 25),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: Container(
                                              height: 60,
                                              color: Colors.grey[300],
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Fashion Stylist',
                                                      style: GoogleFonts.lato(
                                                          fontSize: 13,
                                                          color: Colors.blue,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                    SizedBox(
                                                      height: 10,
                                                    ),
                                                    Text(
                                                      'Quality Check',
                                                      style: GoogleFonts.lato(
                                                          fontSize: 13,
                                                          color: Colors.blue,
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              )),
                        ],
                      ),
                    ))
                  ],
                ),
              )
            ],
          );
        });
  }
}
