import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appp/navigations/bottom_nav_bar_cubit.dart';
import 'package:flutter_appp/welcome.dart';
import 'package:flutter_appp/constants.dart';
import 'package:flutter_appp/textStyle.dart';
import 'package:flutter_appp/walkThrough.dart';
import 'package:flutter_appp/home.dart';
import 'package:flutter_appp/welcomeNoFirebase.dart';
import 'package:flutter_appp/welcomeUnknown.dart';
import 'package:flutter_bloc/flutter_bloc.dart';



void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  final Future<FirebaseApp> _init = Firebase.initializeApp();


  @override
  Widget build(BuildContext context) {

    return FutureBuilder(
        future: _init,
        builder: (context, snapshot){
          if(snapshot.hasError){
            print("Can't connect to firebase: " +snapshot.error);
            return MaterialApp(
              home: WelcomeScreenNoFB(),
            );
          }
          if(snapshot.connectionState == ConnectionState.done){
            print("Firebase connected");
            return AppBase();
          }
          return MaterialApp(
            home: WelcomeScreenUnknown(),
          );
        }
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Auth',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
        scaffoldBackgroundColor: Colors.white,
      ),
      routes:
      {
        '/': (context) => Splash(),

      },
      //initialRoute:
      //home: WelcomeScreen(),
    );
  }
}

class AppBase extends StatelessWidget {
  const AppBase({
    Key key,
  }) : super(key: key);

  static FirebaseAnalytics analytics = FirebaseAnalytics();
  static FirebaseAnalyticsObserver observer = FirebaseAnalyticsObserver(analytics: analytics);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBarCubit(),
      child:MaterialApp(
      navigatorObservers: <NavigatorObserver> [observer],
      home: WelcomeScreen(analytics: analytics,observer: observer,),)
    );
  }
}