
import 'package:flutter_appp/notifications/notification_model.dart';

abstract class BaseNotificationRepository {
  Stream<List<Future<NotifModel>>> getUserNotifications({String userId});
}