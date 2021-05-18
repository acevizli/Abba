import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appp/rounded_button.dart';
import 'package:flutter_appp/rounded_input_field.dart';
import 'package:flutter_appp/rounded_password_field.dart';
import 'package:flutter_appp/Classes.dart';
import 'package:flutter_appp/signup_screen.dart';





class EditProfilePage extends StatefulWidget {
  final User user;
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  EditProfilePage(this.user, this.analytics, this.observer);


  //ditProfilePage({Key key, @required this.user}) : super(key: key);

  @override
  _EditProfilePage createState() => _EditProfilePage();
}


class _EditProfilePage extends State<EditProfilePage> {
  Future<void> _setCurrentScreen(String page) async{
    await widget.analytics.setCurrentScreen(screenName: page);
    print("setcurrentscreen suceeded");
  }
  TextEditingController NameController = new TextEditingController();
  TextEditingController BioController = new TextEditingController();
  /*User user;
  _EditProfilePage(this.user);*/
  /*TextEditingController profilenamecontroller = TextEditingController();
  TextEditingController biocontroller = TextEditingController();
  final _scaffoldGlobalkey = GlobalKey<ScaffoldState>();
  bool loading = false;
  final User user;*/

  final String name2 = users[0].username;
  final String bio2 = users[0].bio;

  bool _profilenameValid = true;
  bool _bioValid = true;


  @override
  Widget build(BuildContext context) {
    {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            'Edit your Profile',
            style: TextStyle(
              fontSize: 25.0,
              fontWeight: FontWeight.w800,
            ),
          ),
          backgroundColor: Colors.deepPurple,
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image(
                      image: NetworkImage(users[0].profileImg),
                      height: 200,
                      width: 200,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: TextButton(
                        child: Text('Change your picture'),
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.deepPurple,
                          onSurface: Colors.grey,
                        ),
                        onPressed: () {
                          print('Pressed');
                        }
                    ),
                  ),
                ],
              ),
              SizedBox(height: 25,),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: TextField(

                  controller: NameController,
                  onChanged: (hintText) {users[0].username = NameController.text;},
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 3),

                      labelText: users[0].username,

                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: "Enter your new name ",
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: 35.0),
                child: TextField(
                  controller: BioController,
                  onChanged: (hintText) {users[0].username = BioController.text;},
                  decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(bottom: 3),

                      labelText: users[0].bio,
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      hintText: "Enter your new bio",
                      hintStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      )),
                ),
              ),
              //buildTextField(user.username,"Name",value),
              //buildTextField(user.username,"Bio",value),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[

                  ElevatedButton(

                    onPressed: () => {users[0].username = NameController.text, users[0].bio = BioController.text, ("lol"),
                      /*Navigator.push(
                                    context,
                                      MaterialPageRoute(
                                      builder: (context) => NewScreen(text: NameController.text,),
                                                                               )),
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => NewScreen2(text: BioController.text,),
                          )),*/

                      setState(() {
                        widget.user.username = NameController.text;
                        widget.user.bio = BioController.text;
                      }
                      ),
                    },
                    child: Text(
                      "SAVE",
                      style: TextStyle(
                          fontSize: 14,
                          letterSpacing: 2.2,
                          color: Colors.white),
                    ),
                  ),
                  // ignore: deprecated_member_use
                  OutlineButton(
                    padding: EdgeInsets.symmetric(horizontal: 50),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    onPressed: () {
                      _setCurrentScreen("Sign-Up Page");
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) {
                              return SignUpScreen();
                            }
                        ),
                      );
                    },
                    child: Text("CANCEL",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.black)),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    }
  }



  Widget buildTextField(String name, String placeholder,
      value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 35.0),
      child: TextField(
        onChanged: (placeholder) {value = placeholder;},
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 3),

            labelText: name,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            hintText: placeholder,
            hintStyle: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.black,
            )),
      ),
    );
  }
}