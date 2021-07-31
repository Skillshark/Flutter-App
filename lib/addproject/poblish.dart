import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skillshark/controller/pagecon.dart';

class Publish extends StatefulWidget {
  @override
  _PublishState createState() => _PublishState();
}

class _PublishState extends State<Publish> {
  Pagecontrol pp;
  @override
  Widget build(BuildContext context) {
    pp = Provider.of<Pagecontrol>(context);
    return Scaffold(
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Publish',
                  style:
                      GoogleFonts.roboto(fontSize: 18, color: Colors.blue[800]),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          CircleAvatar(
              radius: 30,
              backgroundColor: Colors.white,
              child: Image.asset('img/success.png')),
          SizedBox(
            height: 20,
          ),
          Text(
            'Project Published Successfully!',
            style: GoogleFonts.roboto(fontSize: 24, color: Colors.blue[400]),
          ),
          SizedBox(
            height: 30,
          ),
          RaisedButton(
            onPressed: () {},
            color: Colors.lightBlue,
            child: Padding(
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Text(
                'Add Another Project!',
                style: GoogleFonts.roboto(color: Colors.white),
              ),
            ),
          ),
          SizedBox(
            height: 15,
          ),
          InkWell(
            onTap: () {
              pp.setadd(0);
            },
            child: Text(
              'Back to Projects page',
              style: GoogleFonts.roboto(fontSize: 14, color: Colors.blue[200]),
            ),
          )
        ],
      ),
    );
  }
}
