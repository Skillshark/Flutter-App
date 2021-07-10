import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillshark/component/search.dart';

Widget Carts(Size size) {
  return Padding(
    padding: const EdgeInsets.only(left: 50, right: 50),
    child: Row(
      children: [
        //Based on your interests
        Text(
          'Categories',
          style: GoogleFonts.lato(
              fontSize: 28,
              color: Colors.blue[700],
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          width: 10,
        ),

        Expanded(child: Container()),

        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: 300,
            height: 38,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.black)),
            child: TextField(
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  prefixIcon: Icon(Icons.search),
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Search for a project'),
            ),
          ),
        ),
      ],
    ),
  );
}
