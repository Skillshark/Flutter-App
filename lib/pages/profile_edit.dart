import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:skillshark/components/authentication_services.dart';
import 'package:skillshark/extentions/hover_extentions.dart';
import 'package:skillshark/pages/login.dart';
import 'package:provider/provider.dart';

class profileEditScreen extends StatefulWidget {
  @override
  _profileEditScreenState createState() => _profileEditScreenState();
}

class _profileEditScreenState extends State<profileEditScreen> {
  var emailTextConrtoller = TextEditingController();
  var linkedInTextConrtoller = TextEditingController();
  var firstnameTextController = TextEditingController();
  var lastnameTextController = TextEditingController();
  var gitHubTextConrtoller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        //decoration: BoxDecoration(
        //image: DecorationImage(
        //image: AssetImage("images/signup.jpg"), fit: BoxFit.cover),
        //),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              child: Container(
                child: Row(
                  children: [
                    Icon(
                      Icons.ac_unit_outlined,
                      size: 30,
                      color: Colors.blue,
                    ),
                    Text(
                      'SkillShark',
                      style: TextStyle(
                        color: Colors.blue,
                        fontWeight: FontWeight.bold,
                        fontSize: 30,
                        //shadows: <Shadow>[
                        //Shadow(
                        //offset: Offset(10, 10),
                        //blurRadius: 3,
                        //color: Colors.black)
                        //]
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height,
              child: Center(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 15),
                  child: Container(
                    width: MediaQuery.of(context).size.width * .3,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(2),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.7),
                              offset: Offset(4, 4),
                              blurRadius: 8,
                              spreadRadius: 4),
                          BoxShadow(
                              color: Colors.white.withOpacity(0.7),
                              offset: Offset(-4, -4),
                              blurRadius: 8,
                              spreadRadius: 4),
                        ]),
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: MediaQuery.of(context).size.width * .2,
                        child: ListView(
                          scrollDirection: Axis.vertical,
                          shrinkWrap: true,
                          children: [
                            Container(
                              child: Text(
                                'Edit Profile',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width * .2 + 5,
                              height:
                                  MediaQuery.of(context).size.width * .2 + 5,
                              child: Stack(
                                children: [
                                  Center(
                                    child: Container(
                                      width: MediaQuery.of(context).size.width *
                                          .2,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              .2,
                                      padding: EdgeInsets.all(8),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          image:
                                              AssetImage('images/profile.jpg'),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    bottom: 0,
                                    right: 0,
                                    child: InkWell(
                                      onTap: () {},
                                      child: Container(
                                        height: 5,
                                        width: 5,
                                        child: Icon(Icons.edit),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: TextField(
                                controller: firstnameTextController,
                                decoration: InputDecoration(
                                  labelText: 'First Name',
                                ),
                              ),
                            ),
                            Container(
                              child: TextField(
                                controller: lastnameTextController,
                                decoration: InputDecoration(
                                  labelText: 'Last Name',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: TextField(
                                controller: emailTextConrtoller,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  prefixIcon: Icon(Icons.mail_outline),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              child: TextField(
                                controller: gitHubTextConrtoller,
                                cursorColor: Colors.black45,
                                decoration: InputDecoration(
                                  labelText: 'GitHub',
                                  prefixIcon: Icon(Icons.lock_outline_rounded),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            Container(
                              child: TextField(
                                controller: linkedInTextConrtoller,
                                decoration: InputDecoration(
                                  labelText: 'LinkedIn',
                                  prefixIcon: Icon(Icons.mail_outline),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () {},
                              child: Center(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * .2 -
                                          2,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.black45,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Edit Info',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w700,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ).moveUpOnHover,
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
