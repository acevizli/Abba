
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

enum NotifType {
  like,
  comment,
  follow,
}

class NotifModel {
  final String id;
  final NotifType type;
  //TODO make assoc.
  /*final User user;
  final Post post;
   */
  final NetworkImage img;
  final DateTime date;
  final String user;
  NotifModel({this.id, @required this.type,
    @required this.img,this.date,@required this.user,
  });
  }

