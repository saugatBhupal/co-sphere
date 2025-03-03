part of 'notification_bloc.dart';

sealed class NotificationState extends Equatable {
  const NotificationState();

  @override
  List<Object> get props => [];
}

final class NotificationInitial extends NotificationState {}

class GetNotificationsLoading extends NotificationState {
  const GetNotificationsLoading();
}

class GetNotificationsSuccess extends NotificationState {
  final List<NotificationEntity> notifications;
  const GetNotificationsSuccess({required this.notifications});
}

class GetNotificationsFailed extends NotificationState {
  final String message;
  const GetNotificationsFailed({required this.message});
}

class DeleteNotificationsLoading extends NotificationState {
  const DeleteNotificationsLoading();
}

class DeleteNotificationsSuccess extends NotificationState {
  final String message;
  const DeleteNotificationsSuccess({required this.message});
}

class DeleteNotificationsFailed extends NotificationState {
  final String message;
  const DeleteNotificationsFailed({required this.message});
}
