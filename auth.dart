import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_appp/db/database.dart';
import 'package:flutter_appp/helperfunctions/sharedpref_helper.dart';
import 'package:flutter/material.dart';
import 'database.dart';



class AuthService {

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // create user obj based on firebase user
  User _userFromFirebaseUser(User user) {
    return user != null ? user : null;
  }

  //Auth Stream
  Stream<User> get user {
    return _auth.authStateChanges().map(_userFromFirebaseUser);
  }

  // sign in anon
  Future signInAnon() async {
    try {
      UserCredential result = await _auth.signInAnonymously();
      User user = result.user;
      return _userFromFirebaseUser(user);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

// sign in with email and password
  Future signInWithEmailAndPassword(String email, String password,String username) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(email: email, password: password);

      User user = result.user;

      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());


      if(error.code == 'user-not-found')
      {
        registerWithEmailAndPassword(email, password,username);
      }
      else if(error.code == 'wrong-password')
      {
        print("wrong pass");
      }
      return null;
    }
  }


// register with email and password
  Future registerWithEmailAndPassword(String email, String password,String username) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(email: email, password: password);
      User user = result.user;
      DatabaseService(uid: user.uid).createUserData(email, username);
      return _userFromFirebaseUser(user);
    } catch (error) {
      print(error.toString());
      return null;
    }
  }

// sign out
  Future signOut() async {
    try {
      return await _auth.signOut();
    } catch (error) {
      print(error.toString());
      return null;
    }
  }
}