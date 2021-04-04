import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:skillshark/components/authentication_services.dart';
import 'package:skillshark/pages/dashboard.dart';
import 'package:skillshark/pages/landing.dart';
import 'package:skillshark/pages/login.dart';
import 'package:skillshark/pages/post_edit.dart';
import 'package:skillshark/pages/profile.dart';
import 'package:skillshark/pages/profile_edit.dart';
import 'package:skillshark/pages/videoplayer_page.dart';
import 'pages/signup.dart';
import 'package:provider/provider.dart';

void main() => runApp(SignUpApp());

class SignUpApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<AuthenticationService>(
          create: (_) => AuthenticationService(FirebaseAuth.instance),
        ),
        StreamProvider(
          create: (context) =>
              context.read<AuthenticationService>().authStateChanges,
          initialData: null,
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          textTheme:
              GoogleFonts.sourceSansProTextTheme(Theme.of(context).textTheme),
          primaryColor: Colors.grey,
        ),
        routes: {
          '/': (context) => authenticationWrapper(),
          '/signup': (context) => signupScreen(),
          '/login': (context) => loginScreen(),
          '/dashbord': (context) => dashboardScreen(),
          '/landing': (context) => landingScreen(),
          '/profile': (context) => profileScreen(),
          '/profile_edit': (context) => profileEditScreen(),
          '/video_player': (context) => vidPlayer(),
          '/post_edit': (context) => postEdit(),
        },
      ),
    );
  }
}

class authenticationWrapper extends StatelessWidget {
  const authenticationWrapper({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final firebaseUser = context.watch<User>();

    if (firebaseUser != null) {
      return dashboardScreen();
    } else {
      return landingScreen();
    }
  }
}
