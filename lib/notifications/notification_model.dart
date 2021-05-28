
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../Classes.dart';
import 'package:enum_to_string/enum_to_string.dart';
import 'package:meta/meta.dart';
enum NotifType {
  like,
  comment,
  follow,
}

class NotifModel extends Equatable{
  final String id;
  final NotifType type;
  final User user;
  final Post post;
  final DateTime date;
  NotifModel({this.id, @required this.type, this.post,this.date,@required this.user,});

  @override
  List<Object> get props => [id,type,user,post,date];

  Map<String,dynamic> toDocument()
  {
    final notifType = EnumToString.convertToString(type);
    return
        {
          'type' : notifType,
          'fromUser':'users[0]', // TODO connect to user collection
          'post': post != null?'posts[0]':null, //TODO connect to post collection
          'date':Timestamp.fromDate(date),
        };
  }
  static Future<NotifModel> fromDocument(DocumentSnapshot snapshot) async
  {
    if(snapshot == null) return null;
    dynamic data = snapshot.data();
    final notiftype = EnumToString.fromString(NotifType.values, data['type']);
    final userRef = data['fromUser']; //as DocumentReference; //todo
    if(userRef != null)
    {
      final user = users[0];//await userRef.get(); //todo
      final postRef = data['post']; //as DocumentReference; //todo
      if(postRef != null)
      {
          final post = posts[0];//await postRef.get(); //todo
          if(post != null)
          {
            return NotifModel(id:snapshot.id, type: notiftype, user: user,//UserModel.fromDocument(user), //todo
                 post: posts[0],//PostModel.fromDocument(post), //todo
                 date: (data['date'] as Timestamp)?.toDate());
          }
          else
          {
            return NotifModel(id:snapshot.id, type: notiftype, user: user,//UserModel.fromDocument(user), //todo
                post: post,
                date: (data['date'] as Timestamp)?.toDate());
          }
      }
    }
  }
}
