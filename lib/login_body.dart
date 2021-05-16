import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_appp/GoogleSignInProvider.dart';
import 'package:flutter_appp/login_background.dart';
import 'package:flutter_appp/signup_screen.dart';
import 'package:flutter_appp/Classes.dart';
import 'package:flutter_appp/already_have_an_account_acheck.dart';
import 'package:flutter_appp/Profile/ProfilePage.dart';
import 'package:flutter_appp/rounded_button.dart';
import 'package:flutter_appp/rounded_input_field.dart';
import 'package:flutter_appp/rounded_password_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_appp/welcome.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:provider/provider.dart';
import 'textStyle.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_appp/navigations/NavigationScreen.dart';


class Body extends StatelessWidget {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  Body({
    Key key, this.analytics, this.observer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    bool findUser(String username){
      for(var i in users)
      {
        if(i.username == username)
        {
          return true;
        }

      }
      return false;

    };



    String username,password;
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            OutlineButton.icon(
                onPressed: (){
                  final _provider = Provider.of<GoogleSignInProvider>(context,listen : false);
                  _provider.login();
                },
                label: Text('Sign in with Google'),
              shape: StadiumBorder(),
              highlightedBorderColor: Colors.black,
              borderSide: BorderSide(color: Colors.black),
              icon: FaIcon(FontAwesomeIcons.google,color: Colors.red )
            ),
            SizedBox(
              width: 150,
              child: Align(
                alignment: Alignment.topLeft,
                child:  RoundedButton(
                  text: "BACK",
                  press: () { Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return WelcomeScreen(analytics: analytics, observer: observer,);
                      },
                    ),
                  );},
                ),
              ),
            ),

            Text(
              "LOGIN",
              style: GoogleFonts.lato(
                textStyle: stylePost,

              ),
            ),
            SizedBox(height: size.height * 0.03),
            Image.network('https://www.seekpng.com/png/full/47-475361_facebook-flat-logo-twitter-flat-logo-instagram-flat.png',height: size.height * 0.20,),
            SizedBox(height: size.height * 0.03),
            RoundedInputField(
              hintText: "Username",
              onChanged: (value) {username=value;},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "LOGIN",
              press: () {
                if (findUser(username)) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return NavigationScreen(analytics: analytics, observer: observer,);
                      },
                    ),
                  );
                }
                else if (username == null){
                  showDialog(
                    context: context,
                    builder: (context) => new AlertDialog(
                      title: new Text('Empty Username'),
                      content: Text(
                          'Please fill the username area'),
                      actions: <Widget>[
                        new FlatButton(
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true)
                                .pop(); // dismisses only the dialog and returns nothing
                          },
                          child: new Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
                else{
                  showDialog(
                    context: context,
                    builder: (context) => new AlertDialog(
                      title: new Text('User not found'),
                      content: Text(
                          'Username is not found.'),
                      actions: <Widget>[
                        new FlatButton(
                          onPressed: () {
                            Navigator.of(context, rootNavigator: true)
                                .pop(); // dismisses only the dialog and returns nothing
                          },
                          child: new Text('OK'),
                        ),
                      ],
                    ),
                  );
                }
              },
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) {
                      return SignUpScreen(analytics: analytics, observer: observer,);
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}