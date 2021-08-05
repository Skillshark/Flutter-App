import 'package:flutter/material.dart';
import 'package:flutter_feather_icons/flutter_feather_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:skillshark/controller/pagecon.dart';

class audio extends StatefulWidget {
  @override
  _audioState createState() => _audioState();
}

class _audioState extends State<audio> {
  Pagecontrol pp;
  double slider = 30;
  @override
  Widget build(BuildContext context) {
    pp = Provider.of<Pagecontrol>(context);
    return Container(
      color: Colors.blue.withOpacity(0.2),
      height: 50,
      child: Row(
        children: [
          SizedBox(
            width: 10,
          ),
          GestureDetector(
              onTap: () {
                if (pp.playpause == 0) {
                  pp.setplaypause(1);
                } else {
                  pp.setplaypause(0);
                }
              },
              child: pp.playpause == 1
                  ? Icon(
                      Icons.pause,
                      color: Colors.blue,
                      size: 45,
                    )
                  : Icon(
                      Icons.play_arrow_rounded,
                      color: Colors.blue,
                      size: 45,
                    )),
          SizedBox(
            width: 5,
          ),
          Expanded(
              child: Container(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 2, child: Container()),
                Container(
                  height: 10,
                  child: Slider(
                      min: 0,
                      max: 100,
                      value: pp.slider,
                      onChanged: (v) {
                        setState(() {
                          pp.setslider(v);
                        });
                      }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    '0:29 / 2:45',
                    style: GoogleFonts.abel(color: Colors.blue),
                  ),
                ),
                Expanded(flex: 1, child: Container()),
              ],
            ),
          )),
          SizedBox(
            width: 5,
          ),
          Icon(
            FeatherIcons.speaker,
            color: Colors.blue,
            size: 35,
          ),
          SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }
}
