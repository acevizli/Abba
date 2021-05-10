import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appp/welcome.dart';
import 'package:flutter_appp/constants.dart';
import 'package:flutter_appp/textStyle.dart';
import 'package:flutter_appp/walkThrough.dart';
import 'package:flutter_appp/home.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigations/bottom_nav_bar_cubit.dart';


void main() {
  EquatableConfig.stringify = kDebugMode;
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  // This widget is the root of your application.


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => BottomNavBarCubit(),
      child: MaterialApp(
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
      ),
    );
  }
}