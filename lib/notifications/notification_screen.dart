import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_appp/constants.dart';
import 'package:flutter_appp/notifications/notification_model.dart';
import 'package:flutter_appp/notifications/notification_tile.dart';
import 'package:flutter_appp/notifications/notifications_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../Classes.dart';
import '../textStyle.dart';

class NotificationScreen extends StatelessWidget {
  final FirebaseAnalytics analytics;
  final FirebaseAnalyticsObserver observer;

  @override
  NotificationScreen({Key key, this.analytics, this.observer}) :super(key: key);

  Widget build(BuildContext context) {
    print('in screen');
    return Scaffold(
      appBar: AppBar(title: const Text('Notifications'), centerTitle: true,),
      body: BlocBuilder<NotificationsBloc, NotificationsState>(
        builder: (context, state) {
          switch (state.status) {
            case NotificationsStatus.error:
              return Text('FAILURE');
            case NotificationsStatus.loaded:
              return ListView.builder(
                itemCount: state.notifications.length,
                itemBuilder: (BuildContext context, int index) {
                  final notification = state.notifications[index];
                  return NotifTile(model: notification);
                },
              );
            default:
              return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}