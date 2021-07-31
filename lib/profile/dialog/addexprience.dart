import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillshark/addproject/wid.dart';
import 'package:skillshark/component/wid.dart';

class addExdia {
  Size size;
  BuildContext context;
  var positionControl = TextEditingController();
  var orgControl = TextEditingController();
  var locationControl = TextEditingController();

  addExdia(this.size, this.context);

  dia() {
    showDialog(
        context: context,
        builder: (context) {
          return SimpleDialog(
            children: [
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 25,
                  right: 25,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Edit Experience',
                      style: GoogleFonts.roboto(
                          fontSize: 16,
                          color: Colors.blue[800],
                          fontWeight: FontWeight.bold),
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.clear))
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 25, right: 25, top: 10),
                child: Container(
                  width: 400,
                  height: 300,
                  child: Row(
                    children: [
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              tex('Position'),
                              SizedBox(
                                height: 10,
                              ),
                              field(
                                '',
                                positionControl,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              tex('Company / Organization'),
                              SizedBox(
                                height: 10,
                              ),
                              field(
                                '',
                                orgControl,
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              tex('Location'),
                              SizedBox(
                                height: 10,
                              ),
                              field(
                                '',
                                locationControl,
                              ),
                            ],
                          ),
                        ),
                        flex: 2,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      Expanded(
                        child: Container(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 15,
                              ),
                              t('Period'),
                              SizedBox(
                                height: 10,
                              ),
                              fieldicon2('', Icon(Icons.keyboard_arrow_down)),
                              Expanded(child: Container()),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                      onPressed: () {},
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            left: 20, right: 20),
                                        child: Text('Save'),
                                      )),
                                ],
                              )
                            ],
                          ),
                        ),
                        flex: 1,
                      )
                    ],
                  ),
                ),
              )
            ],
          );
        });
  }
}
