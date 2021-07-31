import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillshark/addproject/wid.dart';
import 'package:skillshark/component/wid.dart';
import 'package:skillshark/model/learn.dart';

class Stly {
  BuildContext context;
  Color colors = Colors.black;
  double v = 50;
  Stly(this.context);

  dia() {
    showDialog(
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (context, setState) {
            return SimpleDialog(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        'Project Styles',
                        style: GoogleFonts.roboto(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.blue),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding:
                      const EdgeInsets.only(left: 15, right: 15, bottom: 5),
                  child: Container(
                    width: 450,
                    height: 200,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              tex('Background Color'),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            height: 40,
                            child: Row(
                              children: [
                                Expanded(
                                    child: Container(
                                  color: Colors.grey[200],
                                  child: InkWell(
                                    onTap: () {
                                      showDialog(
                                          context: context,
                                          builder: (context) {
                                            return SimpleDialog(
                                              children: [
                                                ColorPicker(
                                                  pickerColor: colors,
                                                  onColorChanged: (vvv) {
                                                    setState(() {
                                                      colors = vvv;
                                                      //Navigator.pop(context);
                                                    });
                                                  },
                                                ),
                                              ],
                                            );
                                          });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.all(3.0),
                                      child: Row(
                                        children: [
                                          Text(
                                            'Color Palette',
                                          ),
                                          Expanded(child: Container()),
                                          Icon(Icons.keyboard_arrow_down_sharp)
                                        ],
                                      ),
                                    ),
                                  ),
                                )),
                                SizedBox(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Container(
                                  color: Colors.grey[200],
                                  child: Padding(
                                    padding: const EdgeInsets.all(3.0),
                                    child: Center(
                                        child: Text(
                                      colors.value.toString(),
                                    )),
                                  ),
                                ))
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 15,
                          ),
                          Row(
                            children: [
                              tex('Content Spacing'),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Expanded(
                                child: Slider(
                                    max: 100,
                                    min: 0,
                                    value: v,
                                    onChanged: (vv) {
                                      setState(() {
                                        v = vv;
                                      });
                                    }),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                    color: Colors.grey[300],
                                    borderRadius: BorderRadius.circular(3)),
                                child: Center(
                                    child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Text(v.toInt().toString()),
                                )),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                'px',
                                style: TextStyle(
                                    color: Colors.grey[300],
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(child: Container()),
                      OutlineButton(
                        color: Colors.black,
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text('Cancel'),
                        ),
                      ),
                      SizedBox(
                        width: 5,
                      ),
                      RaisedButton(
                        onPressed: () {},
                        color: Colors.blue,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Embed',
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            );
          });
        });
  }
}
