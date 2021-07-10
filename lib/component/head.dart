import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget Head(Size size){
  return  Container(
    height: 200,
    width: size.width,
    decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [
              //rgba(113, 145, 251, 0.82)
              Colors.blue[200],
              Colors.purple[100]
            ]
        )
    ),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(width: 150,),
        Container(
          height: 261,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Develop your skills and shine in your industry!
              AutoSizeText(
                'Find Your Perfect Job ',
                style:GoogleFonts.lato(fontSize: 30,color: Colors.blue[900],fontWeight: FontWeight.bold),
                maxLines: 2,
              ),
              AutoSizeText(
                'To enleash your talents!',
                style:GoogleFonts.lato(fontSize: 25,color: Colors.blue[800],),
                maxLines: 2,
              ),
              SizedBox(height: 25,),
              RaisedButton(
                  onPressed: (){},
                  color: Colors.white,
                  child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Try Premium',style: TextStyle(color: Colors.blue),),
                  ))
            ],
          ),
        ),
        Expanded(child: Container()),
        Expanded(child: Container(
          decoration:BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('img/banner_img.png'),
                  fit: BoxFit.scaleDown
              )
          ),
        )),
        SizedBox(width: 30,),
      ],
    ),
  );
}