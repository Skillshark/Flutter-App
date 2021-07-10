import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillshark/component/applyj.dart';
import 'package:skillshark/model/jobm.dart';

Widget jobcard(Size size, Jobm e, BuildContext context) {
  return PhysicalModel(
    color: Colors.black,
    elevation: 5,
    child: Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Padding(
        padding: const EdgeInsets.all(9.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(e.avatar))),
                ),
                SizedBox(
                  width: 3,
                ),
                Expanded(
                  child: Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(e.Author,
                            maxLines: 1,
                            overflow: TextOverflow.clip,
                            style: GoogleFonts.lato(fontSize: 13)),
                        SizedBox(
                          height: 1,
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.location_on_sharp,
                              size: 10,
                              color: Colors.grey,
                            ),
                            Text(
                              ' ' + e.location,
                              maxLines: 1,
                              overflow: TextOverflow.clip,
                              style: GoogleFonts.lato(
                                  fontSize: 11, color: Colors.grey),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Icon(
                  Icons.share,
                  size: 15,
                  color: Colors.grey[600],
                ),
                SizedBox(
                  width: 3,
                ),
                Icon(
                  Icons.save,
                  size: 15,
                  color: Colors.grey[600],
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              e.tite,
              maxLines: 1,
              overflow: TextOverflow.clip,
              style: GoogleFonts.lato(
                  fontSize: 12,
                  color: Colors.blue,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              children: [
                Icon(
                  Icons.work_outlined,
                  size: 8,
                  color: Colors.black,
                ),
                Text(
                  ' ' + e.cart,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: GoogleFonts.lato(
                      fontSize: 10, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  width: 3,
                ),
                Icon(
                  Icons.timelapse,
                  size: 8,
                  color: Colors.black,
                ),
                Text(
                  ' ' + e.date,
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: GoogleFonts.lato(
                    fontSize: 10,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              e.content,
              maxLines: 3,
              overflow: TextOverflow.clip,
              style: GoogleFonts.lato(
                fontSize: 14,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Container(
                width: size.width / 4 - 40,
                height: 25,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: e.list.map((el) {
                    return Padding(
                      padding: const EdgeInsets.all(3.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.grey[300],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            el,
                            style: TextStyle(fontSize: 9, color: Colors.black),
                          ),
                        ),
                      ),
                    );
                  }).toList(),
                )),
            Expanded(flex: 2, child: Container()),
            Row(
              children: [
                Expanded(child: Container()),
                Text(
                  'View Job',
                  style: TextStyle(color: Colors.blue),
                ),
                Expanded(child: Container()),
                OutlineButton(
                  onPressed: () {
                    Apply(size, context, e).dial();
                  },
                  child:
                      Text('Apply Now', style: TextStyle(color: Colors.blue)),
                  color: Colors.blueAccent,
                ),
                Expanded(child: Container()),
              ],
            ),
            Expanded(flex: 1, child: Container()),
          ],
        ),
      ),
    ),
  );
}
