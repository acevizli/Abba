import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appp/view_post_screen.dart';
import 'package:flutter_appp/Classes.dart';
import 'package:flutter_appp/constants.dart';
import 'package:flutter_appp/Profile/FollowersPage.dart';
import 'package:flutter_appp/Profile/FollowedPage.dart';
import 'package:flutter_appp/Profile/PostTabs.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

enum ProfileTabs { posts, media, location }

class ViewProfileScreen extends StatefulWidget {
  final User user;
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  ViewProfileScreen({this.user, this.analytics, this.observer});

  @override
  _ViewProfileScreenState createState() => _ViewProfileScreenState();
}

class _ViewProfileScreenState extends State<ViewProfileScreen> {
  bool isPressed = false;
  bool pressOn = false;
  bool pressText = false;

  int likeCount = 15;

  void buttonPressed() {
    //for floatingActionButton
    setState(() {
      likeCount += 1;
    });
  }

  ProfileTabs selectedProfileTab = ProfileTabs.posts;

  Widget getSelectedTab() {
    switch (selectedProfileTab) {
      case ProfileTabs.posts:
        return Column(
          children: widget.user.posts
              .map((post) => PostCard(
                    post: post,
                  ))
              .toList(),
        );
      case ProfileTabs.media:
        return Column(
          children: widget.user.posts
              .map((post) => PostMedia(
            post: post,
          ))
              .toList(),
        );
      case ProfileTabs.location:
        return Column(
          children: widget.user.posts
              .map((post) => PostLocation(
                    post: post,
                  ))
              .toList(),
        );
    }
    return Column(
      children: widget.user.posts
          .map((post) => PostCard(
                post: post,
              ))
          .toList(),
    );
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _setCurrentScreen(String page) async{
      await widget.analytics.setCurrentScreen(screenName: page);
      print("setcurrentscreen suceeded");
    }
    return Scaffold(
      backgroundColor: Color(0xFFEDF0F6),
      body: ListView(
        physics: AlwaysScrollableScrollPhysics(),
        children: <Widget>[
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Text(
                  'ABBA',
                  style: TextStyle(
                    fontFamily: 'Billabong',
                    fontSize: 32.0,
                  ),
                ),
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.save),
                      iconSize: 30.0,
                    ),
                    SizedBox(width: 16.0),
                    Container(
                      width: 35.0,
                      child: IconButton(
                        icon: Icon(Icons.send),
                        iconSize: 30.0,
                        onPressed: () => print('Direct Messages'),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(20.0, 24.0, 20.0, 0.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage:
                          NetworkImage('${widget.user.profileImg}'),
                      radius: 44.0,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          '${widget.user.username}',
                          style: TextStyle(
                            fontFamily: 'BrandonText',
                            fontSize: 28.0,
                            fontWeight: FontWeight.w500,
                            color: kPrimaryColor,
                          ),
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.email,
                              color: kPrimaryColor,
                            ),
                            SizedBox(width: 8.0),
                            Text(
                              '${widget.user.email}',
                              style: TextStyle(
                                fontFamily: 'BrandonText',
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                                color: kPrimaryColor,
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      width: 80,
                    ),
                    RaisedButton(
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(18),
                        side: BorderSide(color: Colors.red),
                      ),
                      textColor: Colors.white,
                      color: pressOn ? Colors.red : Colors.lightGreenAccent,
                      child: pressText ? Text("Follow") : Text("Following"),
                      onPressed: (){
                        setState(() {
                          pressText = !pressText;
                          pressOn = !pressOn;
                        });
                      },

                    ),
                    TextButton(
                      child: Text('  Edit Profile  '),
                      style: TextButton.styleFrom(
                        primary: Colors.white,
                        backgroundColor: kPrimaryColor,
                        onSurface: Colors.grey,
                      ),
                      onPressed: () {
                        print('Pressed');
                      },
                    ),

                  ],
                ),
                Text(
                  '${widget.user.bio}',
                  style: TextStyle(
                    fontFamily: 'BrandonText',
                    fontSize: 18.0,
                    fontWeight: FontWeight.w400,
                    color: kPrimaryColor,
                  ),
                ),
                Divider(
                  color: kPrimaryColor,
                  height: 30,
                  thickness: 2.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          'Posts',
                          style: TextStyle(
                            color: kPrimaryColor,
                            fontFamily: 'BrandonText',
                            fontSize: 18.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        Text(
                          '${widget.user.posts.length}',
                          style: TextStyle(
                            fontFamily: 'BrandonText',
                            fontSize: 24.0,
                            fontWeight: FontWeight.w800,
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        TextButton(
                          child: Text(
                            'Followers',
                            style: TextStyle(
                              fontFamily: 'BrandonText',
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              color: kPrimaryColor,
                            ),
                          ),
                          onPressed: () {
                            _setCurrentScreen("${widget.user}'s Profile Page");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return FollowersPage(
                                    user: widget.user,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                        Text(
                          '${widget.user.followers.length}',
                          style: TextStyle(
                            fontFamily: 'BrandonText',
                            fontSize: 24.0,
                            fontWeight: FontWeight.w800,
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        TextButton(
                          child: Text(
                            'Followed',
                            style: TextStyle(
                              fontFamily: 'BrandonText',
                              fontSize: 18.0,
                              fontWeight: FontWeight.w400,
                              color: kPrimaryColor,
                            ),
                          ),
                          onPressed: () {
                            _setCurrentScreen("${widget.user}'s Profile Page");
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return FollowedPage(
                                    user: widget.user,
                                  );
                                },
                              ),
                            );
                          },
                        ),
                        Text(
                          '${widget.user.followed.length}',
                          style: TextStyle(
                            fontFamily: 'BrandonText',
                            fontSize: 24.0,
                            fontWeight: FontWeight.w800,
                            color: kPrimaryColor,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Divider(
                  color: kPrimaryColor,
                  height: 30,
                  thickness: 2.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(
                        Icons.perm_media_outlined,
                        color: selectedProfileTab == ProfileTabs.posts
                            ? Colors.orange
                            : Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedProfileTab = ProfileTabs.posts;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.grid_view,
                        color: selectedProfileTab == ProfileTabs.media
                            ? Colors.orange
                            : Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedProfileTab = ProfileTabs.media;
                        });
                      },
                    ),
                    IconButton(
                      icon: Icon(
                        Icons.location_on,
                        color: selectedProfileTab == ProfileTabs.location
                            ? Colors.orange
                            : Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          selectedProfileTab = ProfileTabs.location;
                        });
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
          ),
          getSelectedTab(),
        ],
      ),
      
    );
  }
}
