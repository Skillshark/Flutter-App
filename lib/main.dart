import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillshark/pages/login.dart';
import 'pages/signup.dart';

void main() => runApp(SignUpApp());

class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme:
            GoogleFonts.sourceSansProTextTheme(Theme.of(context).textTheme),
      ),
      routes: {
        '/signup': (context) => signupScreen(),
        '/': (context) => loginScreen(),
      },
    );
  }
}
