import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_auth/firebase_auth.dart' as auth;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appp/Classes.dart';
import 'package:flutter_appp/db/database.dart';
import 'package:flutter_appp/rounded_button.dart';
import 'package:flutter_appp/rounded_input_field.dart';
import 'package:flutter_appp/rounded_password_field.dart';
import 'package:flutter_appp/Classes.dart' as classer;
import 'package:flutter_appp/signup_screen.dart';
import 'package:provider/provider.dart';

class GetUserBio extends StatelessWidget {
  final String documentId;

  GetUserBio(this.documentId);

  @override
  Widget build(BuildContext context) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {

        if (snapshot.hasError) {
          return Text("Something went wrong");
        }

        if (snapshot.hasData && !snapshot.data.exists) {
          return Text("Document does not exist");
        }

        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data.data();
          print(data);
          print(data["username"]);
          print(data["bio"]);
          return Text("${data['bio']}");
        }

        return Text("loading");
      },
    );
  }
}





class EditProfilePage extends StatefulWidget {
  final classer.User user;
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  EditProfilePage(this.user, this.analytics, this.observer);


  //ditProfilePage({Key key, @required this.user}) : super(key: key);

  @override
  _EditProfilePage createState() => _EditProfilePage();
}


class _EditProfilePage extends State<EditProfilePage> {
  var usersref = FirebaseFirestore.instance.collection('users');


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


  final String name2 = classer.users[0].username;
  final String bio2 = classer.users[0].bio;

  bool _profilenameValid = true;
  bool _bioValid = true;
  bool priv = false;


  @override
  Widget build(BuildContext context) {
    {
      final user2 = Provider.of<auth.User>(context);
      //final user3 = Provider.of<classer.AppUser>(context);

      return StreamProvider<List<classer.AppUser>>.value(
        value: DatabaseService().users,
        child: Scaffold(
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
                        image: NetworkImage(classer.users[0].profileImg),
                        height: 200,
                        width: 200,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: TextButton(
                          child: priv? Text('go public'): Text("go priv"),
                          style: TextButton.styleFrom(
                            primary: Colors.white,
                            backgroundColor: Colors.deepPurple,
                            onSurface: Colors.grey,
                          ),
                          onPressed: () {

                            setState(() {
                              priv ? FirebaseFirestore.instance.collection('users').doc('${user2.uid}').update({'isPriv': false}): FirebaseFirestore.instance.collection('users').doc('${user2.uid}').update({'isPriv': true});
                              print('Pressed');
                              priv = !priv;
                            });

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
                    onChanged: (hintText) {classer.users[0].username = NameController.text;},
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
                    onChanged: (hintText) {classer.users[0].username = BioController.text;},
                    decoration: InputDecoration(
                        contentPadding: EdgeInsets.only(bottom: 3),

                        labelText: "",
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

                    Text("your bio was"),

                    GetUserBio(user2.uid),

                    ElevatedButton(

                      onPressed: () => {classer.users[0].username = NameController.text, classer.users[0].bio = BioController.text, ("lol"),
                        FirebaseFirestore.instance.collection('users').doc('${user2.uid}').update({'bio': BioController.text}),
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