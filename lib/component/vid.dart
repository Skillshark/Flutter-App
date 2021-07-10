import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillshark/model/video.dart';

Widget vd(video v, Size size) {
  return Padding(
    padding: const EdgeInsets.only(
      bottom: 20,
    ),
    child: Container(
      width: size.width - 100,
      height: 400,
      child: Row(
        children: [
          Expanded(
              child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                    image: AssetImage('assets/' + v.assest),
                    fit: BoxFit.cover)),
          )),
          SizedBox(
            width: 20,
          ),
          Expanded(
              child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15,
                ),
                Text(
                  v.date,
                  style: TextStyle(color: Colors.blue),
                ),
                SizedBox(
                  height: 10,
                ),
                AutoSizeText(
                  v.tite,
                  style: GoogleFonts.lato(
                      fontSize: 17,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                  maxLines: 2,
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Text(
                      'Author :',
                      style: TextStyle(color: Colors.grey),
                    ),
                    CircleAvatar(
                      radius: 10,
                      backgroundImage: AssetImage('assets/' + v.avatar),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Text(
                      v.Author,
                      style: TextStyle(color: Colors.lightBlueAccent),
                    ),
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Container(
                  child: Text(
                    v.content,
                    style: TextStyle(fontSize: 16),
                    overflow: TextOverflow.clip,
                    maxLines: 8,
                  ),
                ),
                SizedBox(
                  height: 15,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Learn More',
                        style: TextStyle(color: Colors.white)),
                  ),
                )
              ],
            ),
          )),
        ],
      ),
    ),
  );
}
