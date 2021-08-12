import 'package:auto_size_text/auto_size_text.dart';
import 'package:csc_picker/csc_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillshark/components/db_service.dart';
import 'package:skillshark/components/models.dart';
import 'package:skillshark/components/storage_service.dart';
import 'package:skillshark/components/userdata_service.dart';
import 'package:skillshark/controller/authcontroller.dart';
import 'package:skillshark/profile/dialog/add%20education.dart';
import 'package:skillshark/profile/dialog/addexprience.dart';
import 'package:skillshark/profile/dialog/experience.dart';
import 'package:provider/provider.dart';

class Edit extends StatefulWidget {
  @override
  _EditState createState() => _EditState();
}

class _EditState extends State<Edit> {
  int radio = 1;
  Size size;
  List skill = ['Car Racing', 'Mechanic', 'Vehicle Testing'];
  var firstnameControl = TextEditingController();
  var secondnameControl = TextEditingController();
  var profossionContol = TextEditingController();
  var univControl = TextEditingController();
  var urlControl = TextEditingController();
  var aboutControl = TextEditingController();
  var emailControl = TextEditingController();
  var mobileControl = TextEditingController();
  var tControl = TextEditingController();
  var fbControl = TextEditingController();
  var instaControl = TextEditingController();
  var linkedinControl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();
    size = MediaQuery.of(context).size;
    return Scaffold(
      body: StreamBuilder<Usr>(
          stream: DatabaseService().getUser(firebaseUser.uid),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              firstnameControl.text = snapshot.data.name;
              linkedinControl.text = snapshot.data.linkedIn;

              return SingleChildScrollView(
                child: Row(
                  children: [
                    Expanded(flex: 1, child: Container()),
                    Expanded(
                        flex: 3,
                        child: Container(
                          child: ListView(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            children: [
                              SizedBox(
                                height: 10,
                              ),
                              AutoSizeText(
                                'Edit Profile',
                                style: GoogleFonts.lato(
                                    fontSize: 20,
                                    color: Colors.blue[900],
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              AutoSizeText(
                                'Basic Information ',
                                style: GoogleFonts.lato(
                                    fontSize: 15,
                                    color: Colors.blue[600],
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  CircleAvatar(
                                    backgroundImage: NetworkImage(
                                      snapshot.data.dplink,
                                    ),
                                    radius: 40,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 5,
                              ),
                              DPUploader(
                                userid: firebaseUser.uid,
                              ),
                              SizedBox(
                                height: 25,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Column(
                                    children: [
                                      t('First Name'),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      field('Tony', firstnameControl),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      t('Profession'),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      field('Car Racer', profossionContol),
                                    ],
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                  )),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      t('Second Name'),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      field('Stark', secondnameControl),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      t('Company/University/School'),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      field('Porsche Cars', univControl),
                                    ],
                                  )),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              CSCPicker(
                                onCountryChanged: (value) {
                                  setState(() {});
                                },
                                onStateChanged: (value) {
                                  setState(() {});
                                },
                                onCityChanged: (value) {
                                  setState(() {});
                                },
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              t('Website URL'),
                              SizedBox(
                                height: 10,
                              ),
                              field('www.porsche.comcom', urlControl),
                              SizedBox(
                                height: 25,
                              ),
                              AutoSizeText(
                                'Personal Information',
                                style: GoogleFonts.lato(
                                  fontSize: 15,
                                  color: Colors.blue[300],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              t('About'),
                              SizedBox(
                                height: 10,
                              ),
                              field(
                                "I'm a Car Racer with 5 years of experience in Porsche Car Industries, Germany.",
                                aboutControl,
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              t('Skills'),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                height: 50,
                                color: Colors.grey[300],
                                child: Center(
                                  child: SingleChildScrollView(
                                    child: Row(
                                      children: skill.map((e) {
                                        return Padding(
                                          padding: const EdgeInsets.all(3.0),
                                          child: Container(
                                            color: Colors.grey[200],
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(3.0),
                                              child: Row(
                                                children: [
                                                  Text(
                                                    e,
                                                    style:
                                                        TextStyle(fontSize: 13),
                                                  ),
                                                  SizedBox(
                                                    width: 2,
                                                  ),
                                                  Icon(
                                                    Icons.clear,
                                                    size: 12,
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      }).toList(),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Row(
                                children: [
                                  Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(2),
                                      child: Icon(Icons.menu),
                                    ),
                                    color: Colors.grey[200],
                                  ),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: Container(
                                          color: Colors.grey[300],
                                          child: Padding(
                                            padding: const EdgeInsets.all(4.0),
                                            child: excard(context),
                                          ))),
                                  Expanded(
                                      child: Container(
                                          child: Padding(
                                    padding: const EdgeInsets.all(4.0),
                                    child: FlatButton.icon(
                                        onPressed: () {
                                          addExdia(size, context).dia();
                                        },
                                        icon: Icon(
                                          Icons.add_circle,
                                          color: Colors.blue,
                                        ),
                                        label: Text(
                                          'Add Experience',
                                          style: GoogleFonts.roboto(
                                              color: Colors.blue),
                                        )),
                                  )))
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              t('Education'),
                              SizedBox(
                                height: 10,
                              ),
                              Container(
                                width: 100,
                                height: 50,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    FlatButton.icon(
                                        onPressed: () {
                                          addeducation(size, context).dia();
                                        },
                                        icon: Icon(
                                          Icons.add_circle,
                                          color: Colors.blue,
                                        ),
                                        label: Text(
                                          'Add Education',
                                          style: GoogleFonts.roboto(
                                              color: Colors.blue),
                                        )),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Contact',
                                style: GoogleFonts.roboto(color: Colors.blue),
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Container(
                                    child: Column(
                                      children: [
                                        t('Mail ID'),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        field('tonystark@gmail.com',
                                            emailControl),
                                      ],
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                    ),
                                  )),
                                  SizedBox(
                                    width: 10,
                                  ),
                                  Expanded(
                                      child: Container(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        t('Mobile Number'),
                                        SizedBox(
                                          height: 10,
                                        ),
                                        field('+49 564899812', mobileControl),
                                      ],
                                    ),
                                  )),
                                ],
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                'Social Media Links',
                                style: GoogleFonts.roboto(
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                children: [
                                  Expanded(
                                      child: Column(
                                    children: [
                                      t('Facebook'),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      field('www.facebook/tonystark.com',
                                          fbControl),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      t('Linked in'),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      field('www.linkedin/tonystark.com',
                                          linkedinControl),
                                    ],
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                  )),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                      child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      t('Instagram'),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      field('www.instagram/tonystark.com',
                                          instaControl),
                                      SizedBox(
                                        height: 20,
                                      ),
                                      t('Twitter'),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      field('www.twitter/tonystark.com',
                                          tControl),
                                    ],
                                  )),
                                ],
                              ),
                              SizedBox(
                                height: 60,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SizedBox(
                                    child: ElevatedButton(
                                      onPressed: () {
                                        UserdataService()
                                            .userEdit(
                                                firebaseUser.uid,
                                                firstnameControl.text,
                                                linkedinControl.text,
                                                '')
                                            .then((value) =>
                                                Navigator.pop(context));
                                      },
                                      child: Text(
                                        'Save Profile',
                                      ),
                                    ),
                                    width: 250,
                                    height: 35,
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 100,
                              ),
                            ],
                          ),
                        )),
                    Expanded(flex: 1, child: Container()),
                  ],
                ),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
    );
  }

  Widget t(String t) {
    return AutoSizeText(
      t,
      style: GoogleFonts.lato(
        fontSize: 16,
        color: Colors.black,
      ),
    );
  }

  Widget field(String s, var control) {
    return Container(
      child: TextField(
        controller: control,
        decoration: InputDecoration(
            border: InputBorder.none,
            filled: true,
            hintText: s,
            fillColor: Colors.grey[200]),
      ),
    );
  }

  Widget field1(String s) {
    return Container(
      child: TextField(
        decoration: InputDecoration(
            border: InputBorder.none,
            filled: true,
            hintText: s,
            suffixIcon: Icon(Icons.menu),
            fillColor: Colors.grey[200]),
      ),
    );
  }

  Widget attr(String s) {
    return Text(
      s,
      style: GoogleFonts.italianno(fontWeight: FontWeight.bold, fontSize: 18),
    );
  }

  Widget radi(
    BuildContext context,
    int i,
  ) {
    return Radio(
        value: i,
        groupValue: radio,
        onChanged: (v) {
          setState(() {
            radio = v;
          });
        });
  }

  Widget excard(BuildContext context) {
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 2,
            ),
            Row(
              children: [
                Text('Car Racer',
                    style:
                        GoogleFonts.roboto(fontSize: 15, color: Colors.black)),
                SizedBox(
                  width: 3,
                ),
                CircleAvatar(
                  radius: 3,
                  backgroundColor: Colors.black12,
                ),
                SizedBox(
                  width: 3,
                ),
                smallt('5 Years'),
              ],
            ),
            SizedBox(
              height: 5,
            ),
            smallt('Porsche Cars, Germany'),
            SizedBox(
              height: 2,
            ),
          ],
        ),
        Expanded(child: Container()),
        InkWell(
          onTap: () {
            Exdia(size, context).dia();
          },
          child: CircleAvatar(
              backgroundColor: Colors.blue,
              radius: 12,
              child: Icon(
                Icons.edit,
                color: Colors.white,
                size: 12,
              )),
        ),
        SizedBox(
          width: 10,
        )
      ],
    );
  }

  Widget smallt(String t) {
    return Text(
      t,
      style: GoogleFonts.roboto(fontSize: 14, color: Colors.grey[700]),
    );
  }
}
