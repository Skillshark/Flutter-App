import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillshark/component/search.dart';

Widget ll() {
  return Row(
    children: [
      //Based on your interests
      Text(
        'Live Streams',
        style: GoogleFonts.lato(
          fontSize: 29,
          color: Colors.blue,
        ),
      ),
      SizedBox(
        width: 10,
      ),
      Text(
        'Based on your interests',
        style: GoogleFonts.lato(
          fontSize: 15,
          color: Colors.grey,
        ),
      ),
      Expanded(child: Container()),
      feild('Sort By'),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          width: 200,
          height: 38,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: Colors.black)),
          child: TextField(
            decoration: InputDecoration(
                fillColor: Colors.white,
                suffixIcon: Icon(Icons.keyboard_arrow_down_sharp),
                filled: true,
                border: InputBorder.none,
                hintText: 'Subscribed'),
          ),
        ),
      ),
    ],
  );
}
