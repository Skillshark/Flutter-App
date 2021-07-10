import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
Widget t(String t){
  return  AutoSizeText(
    t ,
    style:GoogleFonts.roboto(fontSize: 16,color: Colors.black,),
  );
}
Widget field(String s){
  return Container(
    child: TextField(
      decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          hintText: s,
          fillColor: Colors.grey[200]
      ),
    ),
  );
}
Widget bigfield(String v,Color colors,double h ) {
  return Container(
    height: h,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          height: 40,
          color: Colors.grey[400],
          child: Row(
            children: [
              SizedBox(width: 10,),
              Text('Normal'),
              SizedBox(width: 10,),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.keyboard_arrow_up,size: 17),
                  SizedBox(height: 5,),
                  Icon(Icons.keyboard_arrow_down_sharp,size: 17,),
                ],
              ),
              SizedBox(width: 25,),
              attr('B'),
              SizedBox(width: 10,),
              attr('I'),
              SizedBox(width: 10,),
              attr('u'),
              SizedBox(width: 10,),
              Icon(Icons.format_align_left,size: 17,),
              SizedBox(width: 10,),
              Icon(Icons.format_align_right,size: 17,),
            ],
          ),
        ),
        Expanded(
          child: Container(
              color: colors,
              child:TextField(
                maxLines:200,
                decoration: InputDecoration(
                  hintText: v,
                  border: InputBorder.none,
                  filled: true,

                ),
              )
          ),
        )
      ],
    ),
  );
}
Widget attr(String s){
  return Text(s,style:GoogleFonts.italianno(fontWeight: FontWeight.bold,fontSize: 18),);
}
