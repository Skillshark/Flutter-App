import 'package:flutter/cupertino.dart';

import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillshark/model/livem.dart';
import 'package:skillshark/model/up.dart';

Widget upcome(Size size, Up e) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: PhysicalModel(
      elevation: 5,
      color: Colors.black,
      borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10), topRight: Radius.circular(10)),
      child: Container(
        width: size.width / 4 - 55,
        height: 320,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10), topRight: Radius.circular(10))),
        child: Column(
          children: [
            Container(
              height: 180,
              child: Stack(
                children: [
                  Container(
                    height: 180,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            image: AssetImage('assets/' + e.assest),
                            fit: BoxFit.cover)),
                  ),
                  Positioned(
                    top: 5,
                    left: 5,
                    child: Tooltip(
                      message:
                          'Attn Developer: Add to calender will appears \n when user hovers on the card',
                      child: SizedBox(
                        height: 20,
                        width: 100,
                        child: FlatButton.icon(
                            onPressed: () {},
                            color: Colors.grey[400],
                            icon: Icon(
                              Icons.calendar_today_sharp,
                              size: 8,
                            ),
                            label: Text(
                              'Add to calender',
                              style: TextStyle(fontSize: 8),
                            )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
                child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    AutoSizeText(
                      e.tite,
                      style: GoogleFonts.lato(
                          fontSize: 15,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                      maxLines: 2,
                      overflow: TextOverflow.clip,
                    ),
                    SizedBox(
                      height: 6,
                    ),
                    Row(
                      children: [
                        Text(
                          e.date,
                          style: TextStyle(color: Colors.black54, fontSize: 15),
                        ),
                      ],
                    ),
                    Expanded(child: Container()),
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 8,
                          backgroundImage: AssetImage('assets/' + e.avatar),
                        ),
                        SizedBox(
                          width: 5,
                        ),
                        Text(
                          e.Author,
                          style: TextStyle(color: Colors.black87, fontSize: 10),
                        ),
                        Expanded(child: Container()),
                        Text(
                          'Register Now',
                          maxLines: 1,
                          overflow: TextOverflow.clip,
                          style: TextStyle(color: Colors.blue, fontSize: 7),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ))
          ],
        ),
      ),
    ),
  );
}
