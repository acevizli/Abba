import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appp/signup_body.dart';

class SignUpScreen extends StatelessWidget {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  const SignUpScreen({Key key, this.analytics, this.observer}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(analytics: analytics, observer: observer,),
    );
  }
}