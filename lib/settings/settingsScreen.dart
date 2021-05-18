import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appp/GoogleSignInProvider.dart';
import 'package:provider/provider.dart';
class settingsScreen extends StatelessWidget {
  const settingsScreen({Key key, this.analytics, this.observer}) : super(key: key);
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;
  @override
  Widget build(BuildContext context) {
    final _user = FirebaseAuth.instance.currentUser;
    return Scaffold(
      body: Container(
          alignment: Alignment.center,
          child: Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [

                  CircleAvatar(
                    maxRadius: 20,
                    backgroundImage: NetworkImage(_user.photoURL??'https://instagram.fist4-1.fna.fbcdn.net/v/t51.2885-19/s320x320/70221403_2581519468601171_4853188546262990848_n.jpg?tp=1&_nc_ht=instagram.fist4-1.fna.fbcdn.net&_nc_ohc=AtNCqEry0qcAX9XX54D&edm=ABfd0MgBAAAA&ccb=7-4&oh=01a921b30ae0e9a7b4dabf292c34fed9&oe=60C784AF&_nc_sid=7bff83'),
                  ),
                  SizedBox(height: 5,),
                  Text(
                    _user.displayName??_user.email,
                    style: TextStyle(
                    ),
                  ),
                  SizedBox(height: 5,),
                  ElevatedButton(
                    child: Text('LOGOUT'),
                    onPressed: (){
                      final _provider = Provider.of<GoogleSignInProvider>(context,listen: false);
                      if(_provider.isLoggedInWithGoogle) {
                        print('BRUHHH MOMENTS');
                        _provider.logout();
                      }
                      else{
                        FirebaseAuth.instance.signOut();
                      }
                    },
                  ),
                ],
              ),
            ),
          )
      ),
    );
  }
}