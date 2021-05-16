import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
class GoogleSignInProvider extends ChangeNotifier
{
  final _googleSignIn = GoogleSignIn();
  Future login() async
  {
    final _user = await _googleSignIn.signIn();
    if(_user != null)
      {
        final googleAuth = await _user.authentication;
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );
        await FirebaseAuth.instance.signInWithCredential(credential);
      }
  }
  void logout() async
  {
    await _googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
  }
}