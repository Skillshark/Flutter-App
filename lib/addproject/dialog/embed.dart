import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Embed{
  BuildContext context;

  Embed(this.context);



  dia(){
    showDialog(context: context, builder:(context){
      return SimpleDialog(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('Embed',style: GoogleFonts.roboto(fontSize: 18,fontWeight: FontWeight.bold,
                color: Colors.blue),),
              ),
            ],
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.only(left: 15,right: 15,bottom: 5),
            child: Container(
              width: 450,
              height: 250,
              color: Colors.grey[300],
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        color: Colors.white,
                        child: TextField(
                          maxLines: 1000,
                          decoration: InputDecoration(
                            hintText: '< Code > or < Link >',
                            border: InputBorder.none
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5,),
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text('Embed From: Adobe Community Platform, YouTube, Facebook, Spotify, Vimeo and more'
                    ,style:GoogleFonts.roboto(fontSize: 13,color: Colors.black),),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(height: 10,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                SizedBox(width: 10,),
                Text('Learn More',style:GoogleFonts.roboto(fontSize: 16,color: Colors.blue,)),
                Expanded(child: Container()),
                OutlineButton(
                  color: Colors.black,
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Cancel'),
                  ),),
                SizedBox(width: 5,),
                RaisedButton(
                  onPressed: (){},
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Embed',style:GoogleFonts.roboto(color: Colors.white,fontWeight: FontWeight.bold),),
                  ),),
              ],
            ),
          )
        ],
      );
    });
  }
}