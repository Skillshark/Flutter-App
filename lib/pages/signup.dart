import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:skillshark/components/authentication_services.dart';
import 'package:skillshark/extentions/hover_extentions.dart';
import 'package:skillshark/pages/login.dart';
import 'package:provider/provider.dart';

class signupScreen extends StatefulWidget {
  @override
  _signupScreenState createState() => _signupScreenState();
}

class _signupScreenState extends State<signupScreen> {
  final emailTextConrtoller = TextEditingController();
  final passTextConrtoller = TextEditingController();
  final firstnameTextController = TextEditingController();
  final lastnameTextController = TextEditingController();

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
                                'Sign Up',
                                style: TextStyle(
                                    fontSize: 25, fontWeight: FontWeight.w600),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              child: RichText(
                                  text: TextSpan(
                                      text: 'Already have an account?',
                                      style: TextStyle(color: Colors.black),
                                      children: <TextSpan>[
                                    TextSpan(
                                        text: ' Log In',
                                        style:
                                            TextStyle(color: Colors.blueAccent),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.pushReplacement(
                                                context,
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        loginScreen()));
                                          })
                                  ])),
                            ),
                            SizedBox(
                              height: 10,
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
                                obscureText: true,
                                controller: passTextConrtoller,
                                cursorColor: Colors.black45,
                                decoration: InputDecoration(
                                  labelText: 'Password',
                                  prefixIcon: Icon(Icons.lock_outline_rounded),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 50,
                            ),
                            InkWell(
                              onTap: () {
                                context.read<AuthenticationService>().signUp(
                                      email: emailTextConrtoller.text,
                                      password: passTextConrtoller.text,
                                    );
                              },
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
                                      'Create Account',
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
                            SizedBox(
                              height: 30,
                            ),
                            Center(
                              child: Container(
                                child: Text(
                                  'OR',
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.w900),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            InkWell(
                              child: Center(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * .2 -
                                          2,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.red,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Google',
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
                            SizedBox(
                              height: 50,
                            ),
                            InkWell(
                              child: Center(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * .2 -
                                          2,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Facebook',
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
                            Divider(
                              height: 30,
                            ),
                            Container(
                              child: RichText(
                                text: TextSpan(
                                    text: 'Subject to ',
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 10),
                                    children: <TextSpan>[
                                      TextSpan(
                                        text: 'Privacy Policy ',
                                        style: TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 10),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {},
                                      ),
                                      TextSpan(
                                          text: 'and ',
                                          style: TextStyle(
                                              color: Colors.black87,
                                              fontSize: 10)),
                                      TextSpan(
                                        text: 'Terms of condition ',
                                        style: TextStyle(
                                            color: Colors.blueAccent,
                                            fontSize: 10),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {},
                                      ),
                                    ]),
                              ),
                            )
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
