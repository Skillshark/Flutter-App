import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillshark/pages/dashboard.dart';
import 'package:skillshark/pages/login.dart';
import 'package:skillshark/pages/profile.dart';
import 'pages/signup.dart';

void main() => runApp(SignUpApp());

class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme:
            GoogleFonts.sourceSansProTextTheme(Theme.of(context).textTheme),
        primaryColor: Colors.white,
      ),
      routes: {
        '/signup': (context) => signupScreen(),
        '/login': (context) => loginScreen(),
        '/dashbord': (context) => dashboardScreen(),
        '/': (context) => profileScreen(),
      },
    );
  }
}
