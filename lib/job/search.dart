import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget jSearchbar(Size size) {
  return Container(
    width: size.width - 80,
    height: 76,
    decoration: BoxDecoration(
        color: Colors.blue[200].withOpacity(0.3),
        borderRadius: BorderRadius.circular(5)),
    child: Row(
      children: [
        SizedBox(
          width: 10,
        ),
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 38,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintStyle: TextStyle(fontSize: 14),
                    prefixIcon: Icon(Icons.search),
                    filled: true,
                    border: InputBorder.none,
                    hintText: 'Search by class, workshop or channel'),
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        field('Job Types'),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 38,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintStyle: TextStyle(fontSize: 14),
                    suffixIcon: Icon(Icons.keyboard_arrow_down_sharp),
                    filled: true,
                    border: InputBorder.none,
                    hintText: 'Full Time'),
              ),
            ),
          ),
        ),
        field('Field'),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 38,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintStyle: TextStyle(fontSize: 14),
                    suffixIcon: Icon(Icons.keyboard_arrow_down_sharp),
                    filled: true,
                    border: InputBorder.none,
                    hintText: 'All Fields'),
              ),
            ),
          ),
        ),
        field('Place'),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 38,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintStyle: TextStyle(fontSize: 14),
                    suffixIcon: Icon(Icons.keyboard_arrow_down_sharp),
                    filled: true,
                    border: InputBorder.none,
                    hintText: 'Anywhere'),
              ),
            ),
          ),
        ),
        field('Salary Range'),
        Expanded(
          flex: 1,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              height: 38,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
              child: TextField(
                decoration: InputDecoration(
                    fillColor: Colors.white,
                    hintStyle: TextStyle(fontSize: 14),
                    suffixIcon: Icon(Icons.keyboard_arrow_down_sharp),
                    filled: true,
                    border: InputBorder.none,
                    hintText: '20K-40K'),
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget field(String string) {
  return Text(
    string,
    style: GoogleFonts.lato(
        fontSize: 13, color: Colors.blue[900], fontWeight: FontWeight.bold),
  );
}
