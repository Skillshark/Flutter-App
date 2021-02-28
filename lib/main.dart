import 'package:flutter/material.dart';
import 'pages/signup.dart';

void main() => runApp(SignUpApp());

class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/': (context) => signupScreen(),
      },
    );
  }
}
