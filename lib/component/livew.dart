import 'dart:math';

import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillshark/model/livem.dart';

Widget livew(Size size, Live e) {
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
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                      image: AssetImage('assets/' + e.assest),
                      fit: BoxFit.cover)),
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
                      height: 2,
                    ),
                    Container(
                        width: size.width / 4 - 40,
                        height: 25,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: e.list.map((el) {
                            return Padding(
                              padding: const EdgeInsets.all(3.0),
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[300],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4.0),
                                  child: Text(
                                    el,
                                    style: TextStyle(
                                        fontSize: 9,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                        )),
                    SizedBox(
                      height: 2,
                    ),
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
