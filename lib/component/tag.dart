import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillshark/model/learn.dart';

Widget tag(Size size) {
  return Padding(
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
              children: tt.map((e) {
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
  );
}
