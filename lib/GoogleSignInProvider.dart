import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
class GoogleSignInProvider extends ChangeNotifier
{
  final _googleSignIn = GoogleSignIn();
  bool _isLoggedInWithGoogle;
  bool _isSigning;
  GoogleSignInProvider()
  {
    _isLoggedInWithGoogle = false;
    _isSigning = false;
  }

  bool get isSigning => _isSigning;
  set isSigning(bool isSigning)
  {
    _isSigning = isSigning;
    notifyListeners();
  }
  bool get isLoggedInWithGoogle => _isLoggedInWithGoogle;
  set isLoggedInWithGoogle(bool isLoggedInWithGoogle)
  {
    _isLoggedInWithGoogle = isLoggedInWithGoogle;
    notifyListeners();
  }
  Future login() async
  {
    isSigning = true;
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
    isSigning = false;
    isLoggedInWithGoogle = true;
  }
  void logout() async
  {
    await _googleSignIn.disconnect();
    FirebaseAuth.instance.signOut();
    isLoggedInWithGoogle = false;
  }
}