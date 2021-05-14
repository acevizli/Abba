import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appp/constants.dart';
import 'package:flutter_appp/rounded_button.dart';
import 'package:flutter_appp/signup_screen.dart';
import 'package:flutter_appp/welcome_body.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_appp/textStyle.dart';

import 'login_background.dart';
import 'login_screen.dart';

class WelcomeScreen extends StatefulWidget {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  const WelcomeScreen({Key key, this.analytics, this.observer}) : super(key: key);
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  String _msg = "";

  void setMessage(String msg){
    setState(() {
      _msg = msg;
    });
  }

  Future<void> _setCurrentScreen() async{
    await widget.analytics.setCurrentScreen(screenName: "Welcome Page");
    setMessage("setcurrentscreen suceeded");
  }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        centerTitle: true,
        title: Text(
            "ABBA",
            style: GoogleFonts.lato(
              textStyle: styleAppBar,
            ),
        ),

      ),
      body: Background(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(height: size.height * 0.05),
              Image.network('https://alexorl.edu.eg/congress/wp-content/uploads/2018/10/welcome.png'),
              SizedBox(height: size.height * 0.05),
              OutlineButton(onPressed: _setCurrentScreen),
              RoundedButton(
                text: "LOGIN",
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return LoginScreen();
                      },
                    ),
                  );
                },
              ),
              RoundedButton(
                text: "SIGN UP",
                color: kPrimaryLightColor,
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return SignUpScreen();
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      )
    );
  }
}