import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillshark/auth/signup.dart';
import 'package:skillshark/component/cart.dart';
import 'package:skillshark/component/live.dart';
import 'package:skillshark/component/livew.dart';
import 'package:skillshark/component/search.dart';
import 'package:skillshark/component/upcoming.dart';
import 'package:skillshark/component/vid.dart';
import 'package:skillshark/model/learn.dart';
import 'package:skillshark/model/livem.dart';
import 'package:skillshark/model/up.dart';
import 'package:skillshark/model/video.dart';

class Body extends StatefulWidget {
  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  Size size;
  String d = 'Automobile';
  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 0, right: 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 200,
                width: size.width,
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                  //rgba(113, 145, 251, 0.82)
                  Colors.blue[200],
                  Colors.purple[100]
                ])),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 150,
                    ),
                    Container(
                      height: 261,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //Develop your skills and shine in your industry!
                          AutoSizeText(
                            'Learn Anything With Our Experts ',
                            style: GoogleFonts.lato(
                                fontSize: 30,
                                color: Colors.blue[900],
                                fontWeight: FontWeight.bold),
                            maxLines: 2,
                          ),
                          AutoSizeText(
                            'Develop your skills and shine in your industry!',
                            style: GoogleFonts.lato(
                              fontSize: 25,
                              color: Colors.blue[800],
                            ),
                            maxLines: 2,
                          ),
                          SizedBox(
                            height: 25,
                          ),
                          RaisedButton(
                              onPressed: () {},
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  'Try Premium',
                                  style: TextStyle(color: Colors.blue),
                                ),
                              ))
                        ],
                      ),
                    ),
                    Expanded(child: Container()),
                    Expanded(
                        child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/images/learn.png'),
                              fit: BoxFit.scaleDown)),
                    )),
                    SizedBox(
                      width: 30,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: AutoSizeText(
                  'Learn by Fields',
                  style: GoogleFonts.lato(
                      fontSize: 20,
                      color: Colors.blue[700],
                      fontWeight: FontWeight.bold),
                  maxLines: 2,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Cart(size, context),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Searchbar(size),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
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
                          children: t.map((e) {
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
                        label: Text('Add Tags'),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50),
                child: Row(
                  children: [
                    //Based on your interests
                    Text(
                      'Workshop & Classes',
                      style: GoogleFonts.lato(
                        fontSize: 32,
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
                    feild('Field'),
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
                              hintText: 'Automobile'),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, bottom: 20),
                child: ListView(
                  physics: NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: v.map((e) {
                    return vd(e, size);
                  }).toList(),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 50, right: 50, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    OutlineButton(
                      onPressed: () {},
                      color: Colors.blue,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text('View All'),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 50,
                  right: 50,
                ),
                child: ll(),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 50,
                  right: 50,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.4),
                          shape: BoxShape.circle),
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.blue[900],
                        size: 15,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Container(
                        height: 300,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: li.map((e) {
                            return livew(size, e);
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.4),
                          shape: BoxShape.circle),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.blue[900],
                        size: 15,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 50,
                  right: 50,
                ),
                child: Text(
                  'Upcoming Classes',
                  style: GoogleFonts.lato(
                    fontSize: 29,
                    color: Colors.blue,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 50,
                  right: 50,
                ),
                child: Row(
                  children: [
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.4),
                          shape: BoxShape.circle),
                      child: Icon(
                        Icons.arrow_back_ios_rounded,
                        color: Colors.blue[900],
                        size: 15,
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Expanded(
                      child: Container(
                        height: 300,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: u.map((e) {
                            return upcome(size, e);
                          }).toList(),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      height: 25,
                      width: 25,
                      decoration: BoxDecoration(
                          color: Colors.blue.withOpacity(0.4),
                          shape: BoxShape.circle),
                      child: Icon(
                        Icons.arrow_forward_ios_rounded,
                        color: Colors.blue[900],
                        size: 15,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
