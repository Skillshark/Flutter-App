import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget t(String t) {
  return AutoSizeText(
    t,
    style: GoogleFonts.roboto(
      fontSize: 16,
      color: Colors.black,
    ),
  );
}

Widget fieldicon2(String s, Icon icon) {
  return Container(
    child: TextField(
      decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          hintText: s,
          suffixIcon: icon,
          fillColor: Colors.grey[200]),
    ),
  );
}

Widget field(String s, var control) {
  return Container(
    child: TextFormField(
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Please enter some text';
        }
        return null;
      },
      controller: control,
      decoration: InputDecoration(
          border: InputBorder.none,
          filled: true,
          hintText: s,
          fillColor: Colors.grey[200]),
    ),
  );
}

Widget bigfield(String v, Color colors, double h, var control) {
  return Container(
    height: h,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: Container(
            color: colors,
            child: TextFormField(
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter some text';
                }
                return null;
              },
              controller: control,
              maxLines: 200,
              decoration: InputDecoration(
                hintText: v,
                border: InputBorder.none,
                filled: true,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}

Widget attr(String s) {
  return Text(
    s,
    style: GoogleFonts.italianno(fontWeight: FontWeight.bold, fontSize: 18),
  );
}
