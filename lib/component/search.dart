import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget Searchbar(Size size){
  return Container(
    width: size.width-80,
    height:76,
    decoration: BoxDecoration(
      color: Colors.blue[200].withOpacity(0.3),
      borderRadius: BorderRadius.circular(5)
    ),

    child: Row(
      children: [
        SizedBox(width: 10,),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: size.width/4-30,
            height: 38,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5)
            ),
            child: TextField(
              decoration: InputDecoration(
                fillColor: Colors.white,
                prefixIcon: Icon(Icons.search),
                filled: true,
                border: InputBorder.none,
                hintText: 'Search by class, workshop or channel'
              ),
            ),
          ),
        ),
        SizedBox(width: 10,),
        feild('Field'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: size.width/4-70,
            height: 38,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5)
            ),
            child: TextField(
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  suffixIcon: Icon(Icons.keyboard_arrow_down_sharp),
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'Automobiles'
              ),
            ),
          ),
        ),
        feild('Language'),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: size.width/4-70,
            height: 38,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5)
            ),
            child: TextField(
              decoration: InputDecoration(
                  fillColor: Colors.white,
                  suffixIcon: Icon(Icons.keyboard_arrow_down_sharp),
                  filled: true,
                  border: InputBorder.none,
                  hintText: 'English'
              ),
            ),
          ),
        ),
      ],
    ),
  );
  
}
Widget feild(String string){
  return Text(string,
    style:GoogleFonts.lato(fontSize: 15,color: Colors.blue[900],fontWeight: FontWeight.bold),);
}