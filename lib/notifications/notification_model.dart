
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Classes.dart';

enum NotifType {
  like,
  comment,
  follow,
}

class NotifModel {
  final String id;
  final NotifType type;
  final User user;
  final Post post;
  final DateTime date;
  NotifModel({this.id, @required this.type, this.post,this.date,@required this.user,});
  }

