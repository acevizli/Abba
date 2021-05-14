import 'package:flutter/material.dart';
import 'package:flutter_appp/Profile/ProfilePage.dart';
import 'package:flutter_appp/constants.dart';
import 'package:flutter_appp/signup_screen.dart';
import 'package:flutter_appp/view_post_screen.dart';
import 'package:intl/intl.dart';

import '../Classes.dart';
import '../textStyle.dart';
import 'notification_model.dart';

class NotifTile extends StatelessWidget {
  NotifModel model;
  NotifTile({this.model});
  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(model.user.profileImg),
          radius: 18,
        ),
        title: Text(
          model.user.toString() + getText(),
          style: TextStyle(
            color: kPrimaryColor,
            fontSize: 20,
          ),
        ),
        subtitle: Text(
          DateFormat.MMMd().add_jm().format(model.date),
          style: TextStyle(
            fontSize: 18,
          ),
        ),
        trailing: _getTrailing(context,model),
        onTap:() => { Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ViewProfileScreen(user: model.user,);
        }))
        },
      ),
    );
  }
  String getText()
  {
    switch(model.type){
      case NotifType.comment: return ' commented to your post';
      case NotifType.follow: return ' followed you';
      case NotifType.like: return ' liked your post';
    }
  }
}



Widget _getTrailing(BuildContext context, NotifModel model) {
  if (model.type == NotifType.like ||
      model.type == NotifType.comment) {
    return GestureDetector(
      onTap: () =>{ Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return ViewPostScreen(post: model.post,);
      }))
      },
      child: SizedBox(
        height: 60.0,
        width: 60.0,
        child: Icon(Icons.photo_album_sharp),
    ),
  );
  } else if (model.type == NotifType.follow) {
    return GestureDetector(
      onTap: ()
      {
        model.user.followed.add(users[0].id);
      },
      child: SizedBox(
        height: 60.0,
        width: 60.0,
        child: Icon(Icons.person_add),
      ),
    );
  }
  return const SizedBox.shrink();
}