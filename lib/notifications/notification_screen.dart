import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appp/constants.dart';
import 'package:flutter_appp/notifications/notification_model.dart';
import 'package:flutter_appp/notifications/notification_tile.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Classes.dart';
import '../textStyle.dart';

class NotificationScreen extends StatelessWidget {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  List<NotifModel> notifications = [
    NotifModel(type: NotifType.like, post: posts[0], user: users[1],date:DateTime.now()),
    NotifModel(type: NotifType.comment, post: posts[0], user: users[1],date :DateTime.now()),
    NotifModel(type: NotifType.follow, user: users[1],date: DateTime.now()),
  ];

  NotificationScreen({Key key, this.analytics, this.observer}) : super(key: key);
  Widget build(BuildContext context) {//TODO enrich UI
    Future<void> _setCurrentScreen(String page) async{
      await analytics.setCurrentScreen(screenName: page);
      print("setcurrentscreen suceeded");
    }
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
        body: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'Notifications',
                    style: GoogleFonts.lato(
                      textStyle: stylePost,
                    ),
                  ),
                  Divider(
                    color: kPrimaryColor,
                    height: 20,
                    thickness: 3,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: notifications.map((notif) => NotifTile(model: notif)).toList(),
                      ),
                    ),
                  ),
                ]
            )
        )
    );
  }
}