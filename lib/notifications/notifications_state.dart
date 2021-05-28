part of 'notifications_bloc.dart';

enum NotificationsStatus { initial, loading, loaded, error }

class NotificationsState extends Equatable {
  final List<NotifModel> notifications;
  final NotificationsStatus status;

  const NotificationsState({
    @required this.notifications,
    @required this.status,
  });

  factory NotificationsState.initial() {
    return const NotificationsState(
      notifications: [],
      status: NotificationsStatus.initial,
    );
  }

  @override
  List<Object> get props => [notifications, status];

  NotificationsState copyWith({
    List<NotifModel> notifications,
    NotificationsStatus status,
  }) {
    return NotificationsState(
      notifications: notifications ?? this.notifications,
      status: status ?? this.status,
    );
  }
}