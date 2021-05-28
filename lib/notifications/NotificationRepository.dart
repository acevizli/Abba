import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_appp/notifications/notification_model.dart';
import 'package:meta/meta.dart';

import 'base_notification_repository.dart';

class NotificationRepository extends BaseNotificationRepository {
  final FirebaseFirestore _firebaseFirestore;

  NotificationRepository({FirebaseFirestore firebaseFirestore})
      : _firebaseFirestore = firebaseFirestore ?? FirebaseFirestore.instance;

  @override
  Stream<List<Future<NotifModel>>> getUserNotifications({@required String userId}) {
    print('in repo ');
    return _firebaseFirestore
        .collection('notifications')
        .doc(userId)
        .collection('userNotifications')
        .orderBy('date', descending: true)
        .snapshots()
        .map(
          (snap) => snap.docs.map((doc) => NotifModel.fromDocument(doc)).toList(),
    );
  }
}