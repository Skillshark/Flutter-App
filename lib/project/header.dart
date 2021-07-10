import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget PHead(Size size) {
  return Container(
    height: 200,
    width: size.width,
    decoration: BoxDecoration(
      gradient: LinearGradient(colors: [
        //rgba(113, 145, 251, 0.82)
        Colors.blue[200],
        Colors.purple[100]
      ]),
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Expanded(flex: 1, child: SizedBox()),
        Expanded(
          flex: 4,
          child: Container(
            height: 261,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                //Develop your skills and shine in your industry!
                AutoSizeText(
                  'Explore Awesome Projects ',
                  style: GoogleFonts.lato(
                      fontSize: 30,
                      color: Colors.blue[900],
                      fontWeight: FontWeight.bold),
                  maxLines: 2,
                ),
                AutoSizeText(
                  'Beyond Creativity!',
                  style: GoogleFonts.lato(
                    fontSize: 25,
                    color: Colors.blue[800],
                  ),
                  maxLines: 2,
                ),
                SizedBox(
                  height: 25,
                ),
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(),
                    child: Container(
                      width: 100,
                      height: 25,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            offset: Offset(0, 2),
                            blurRadius: 3,
                            color: Color(0xFFD6D6D6),
                          ),
                        ],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Center(
                        child: Text(
                          'View New Projects',
                          style: TextStyle(
                            color: Color(0xFF2EA5FF),
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/landing_banner.png'),
                fit: BoxFit.scaleDown,
              ),
            ),
          ),
        ),
      ],
    ),
  );
}
