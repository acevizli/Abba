import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../Classes.dart';

class DatabaseService{
  final String uid;
  DatabaseService({this.uid});


  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Future<void> createUserData(String email, String username)
  async {
    List<String> followers;
        List<String> followed;
        List<String> notifs;
            bool isPriv;
            String bio;
    List<String> posts;
    posts = [];
    String profileImg = "";
    bio = "";
    isPriv = false;
    profileImg = "https://www.w3schools.com/howto/img_avatar.png";
    notifs = [];
    followers = [];
    followed = [];
    return await userCollection.doc(uid).set({
      'username': username,
      'email': email,
      'followers': followers,
      'followed': followed,
      'bio': bio,
      'posts': posts,
      'isPriv': isPriv,
      'notifs': notifs,
      'uid': uid,
      'profileImg': profileImg
    });
  }

  List<AppUser> _userListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return  AppUser(
        username: doc["username"],
        bio: doc["bio"],
        email: doc["email"],
        followers: doc["followers"],
        followed: doc["followed"],
        notifications: doc["notifs"],
        isPriv: doc["isPriv"],
        posts: doc["posts"],
        profileImg: doc["profileImg"],
      );
    }).toList();
  }


  Stream<List<AppUser>> get users {
    return userCollection.snapshots().map(_userListFromSnapshot);
  }
}

