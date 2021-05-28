import 'package:cloud_firestore/cloud_firestore.dart';

import '../Classes.dart';

class DatabaseService{
  final String uid;
  DatabaseService({this.uid});

  final CollectionReference userCollection = FirebaseFirestore.instance.collection('users');

  Future<void> createUserData(String email, String username)
  async {
    return await userCollection.doc(uid).set({
      'username': username,
      'email': email
    });
  }

  List<User> userListFromSnapshot(QuerySnapshot snapshot){
    return snapshot.docs.map((doc){
      return User(
        username: doc["username"],
      );
    }).toList();
  }


  Stream<List<User>> get users {
    return userCollection.snapshots().map(userListFromSnapshot);

  }


}