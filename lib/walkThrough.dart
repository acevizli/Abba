import 'package:flutter/material.dart';
import 'package:flutter_appp/constants.dart';
import 'package:flutter_appp/welcome.dart';
import 'textStyle.dart';


class WalkThrough extends StatefulWidget {
  @override
  _WalkThroughState createState() => _WalkThroughState();
}

class _WalkThroughState extends State {

  int pageNum = 0;
  int totalPage = 4;
  int index = 0;
  List <String> buttonName = ['next','Welcome Screen'];
  List <String> appBars = ['WELCOME','INTRO','PROFILES','CONTENT'];
  List <String> titles = ['Awesome ABBA app', 'Signup is easily', 'Create your profile', 'Start meeting new people'];
  List <String> imgUrls = ['assets/first.png', 'assets/sec.jfif',
    'assets/test.gif',
  'assets/social_media.gif'];
  List <String> captions = ['Your personal posts', 'Just use your Social Media account', 'Update your network', 'Connect with new friends'];



  void nextPage() {
    setState(() {
      if(pageNum <= 1){
      pageNum += 1;
      }
      else if(pageNum == 2)
      {
        pageNum += 1;
        index = 1;
      }
      else
        {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => WelcomeScreen()),
                (Route<dynamic> route) => false,
          );
        }
    });

  }

  void prevPage() {
    setState(() {
      if(pageNum != 0){
        pageNum -= 1;
        index=0;
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold (
      backgroundColor: Color(0xFFF2F2F7),
      appBar: AppBar(
        titleSpacing: -1,
        title: Text(
            '${appBars[pageNum]}',
          style: styleAppBar,
        ),
        centerTitle: true,



      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget> [
          Text(
              '${titles[pageNum]}',
            style: TextStyle(
              fontSize: 32.0,
              fontWeight: FontWeight.w800,
              letterSpacing: -1,
              color: kPrimaryLightColor,
            ),
          ),




          CircleAvatar(
            radius: 150,
            backgroundImage: AssetImage('${imgUrls[pageNum]}'),
          ),



          Text(
            '${captions[pageNum]}',
            style: TextStyle(
              fontSize: 24.0,
              fontWeight: FontWeight.w300,
              letterSpacing: -1,
              color: kPrimaryColor,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget> [
              RaisedButton(
                color: kPrimaryLightColor,
                  onPressed: prevPage,
                child: Text(
                    'Prev',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),

              Text(
                  '${pageNum + 1}' + '/' + '$totalPage',
                style: TextStyle(
                    color: kPrimaryColor,
                ),
              ),


              RaisedButton(
                color: kPrimaryLightColor,
                onPressed: nextPage,
                child: Text(
                  '${buttonName[index]}',
                  style: TextStyle(
                    color: Colors.white,

                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}