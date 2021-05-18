import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appp/Profile/ProfilePage.dart';
import 'package:flutter_appp/view_post_screen.dart';
import 'package:flutter_appp/Classes.dart';
import 'package:flutter_appp/constants.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FollowersPage extends StatefulWidget {
  final User user;
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  FollowersPage({this.user, this.analytics, this.observer});

  @override
  _FollowersPage createState() => _FollowersPage();
}

class _FollowersPage extends State<FollowersPage> {
  Future<void> _setCurrentScreen(String page) async{
    await widget.analytics.setCurrentScreen(screenName: page);
    print("setcurrentscreen suceeded");
  }
  @override
  Widget build(BuildContext context) {
    final title = 'Followers';

    return MaterialApp(
      title: title,
      home: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.white),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(title),
          centerTitle: true,
          backgroundColor: kPrimaryColor,
        ),
        body: ListView.builder(
          // Let the ListView know how many items it needs to build.
          itemCount: widget.user.followers.length,
          // Provide a builder function. This is where the magic happens.
          // Convert each item into a widget based on the type of item it is.
          itemBuilder: (context, index) {
            final item = users[widget.user.followers[index]];
            return ListTile(
              title: Column(
                children: [
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage('${item.profileImg}'),
                        radius: 30.0,
                      ),
                      SizedBox(
                        width: 20,
                      ),
                      TextButton(
                        child: Text(
                          item.username,
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          _setCurrentScreen("$item's Profile Page");
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ViewProfileScreen(user: item,);
                              },
                            ),
                          );
                        },
                      ),

                    ],
                  ),
                  Divider(
                    color: kPrimaryColor,
                    height: 30,
                    thickness: 2.0,
                  ),
                ],
              ),

            );
          },
        ),
      ),
    );
  }
}