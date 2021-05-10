import 'package:flutter/material.dart';
import 'package:flutter_appp/welcome_body.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_appp/textStyle.dart';

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            "ABBA",
            style: GoogleFonts.lato(
              textStyle: styleAppBar,
            ),
        ),

      ),
      body: Body(),
    );
  }
}