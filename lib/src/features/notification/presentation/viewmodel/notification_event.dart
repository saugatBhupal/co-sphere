part of 'notification_bloc.dart';

sealed class NotificationEvent extends Equatable {
  const NotificationEvent();

  @override
  List<Object> get props => [];
}

class GetNotificationsByUserId extends NotificationEvent {
  final String uid;

  const GetNotificationsByUserId({required this.uid});
}

class DeleteNotificationsByUserId extends NotificationEvent {
  final String uid;

  const DeleteNotificationsByUserId({required this.uid});
}
