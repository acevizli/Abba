
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appp/login_body.dart';
import 'package:flutter_appp/navigations/NavigationScreen.dart';
import 'package:provider/provider.dart';

import 'GoogleSignInProvider.dart';

class LoginScreen extends StatefulWidget {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  LoginScreen({Key key, this.analytics, this.observer}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ChangeNotifierProvider(
          create: (context) => GoogleSignInProvider(),
          child: StreamBuilder(
              stream: FirebaseAuth.instance.authStateChanges(),
              builder: (context,snapshot)
              {
                final _provider = Provider.of<GoogleSignInProvider>(context,listen : false);
                if(snapshot.hasData) {
                  return NavigationScreen(analytics: widget.analytics,observer: widget.observer,);
                }
                else if(_provider.isSigning) {
                  return loading();
                }
                return Body(analytics: widget.analytics, observer: widget.observer,);
              }
          ),
        ));
  }
  Widget loading() => Center(child: CircularProgressIndicator(),);
}