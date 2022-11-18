// import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';
import 'screens/Signup/SignupPage.dart';

void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return MaterialApp(
      title: "Covid App",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.comfortaaTextTheme(textTheme).copyWith(
          headline1: GoogleFonts.comfortaa(textStyle: kBigText),
          headline5: GoogleFonts.comfortaa(textStyle: kmainText),
          bodyText1: GoogleFonts.comfortaa(textStyle: kHintText),
          bodyText2: GoogleFonts.comfortaa(textStyle: kAcsentText),
        ),
      ),
      home: SignupPage(),
    );
  }
}
