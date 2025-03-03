import 'package:bloc/bloc.dart';
import 'package:cosphere/src/features/notification/domain/entities/notification.dart';
import 'package:cosphere/src/features/notification/domain/usecases/delete_notification_by_userid_usecae.dart';
import 'package:cosphere/src/features/notification/domain/usecases/get_notification_by_user_id_usecase.dart';
import 'package:equatable/equatable.dart';

part 'notification_event.dart';
part 'notification_state.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  final GetNotificationByUserIdUsecase getNotificationByUserIdUsecase;
  final DeleteNotificationByUserIdUsecae deleteNotificationsByUserIdUsecase;
  NotificationBloc(
      {required this.getNotificationByUserIdUsecase,
      required this.deleteNotificationsByUserIdUsecase})
      : super(NotificationInitial()) {
    on<NotificationEvent>((event, emit) async {
      if (event is GetNotificationsByUserId) {
        await _getNotificationsByUserId(event, emit);
      }
      if (event is DeleteNotificationsByUserId) {
        await _geleteNotificationsByUserId(event, emit);
      }
    });
  }
  List<NotificationEntity> _notifications = [];
  List<NotificationEntity> get notifications => _notifications;
  Future<void> _getNotificationsByUserId(
      GetNotificationsByUserId event, Emitter<NotificationState> emit) async {
    emit(const GetNotificationsLoading());
    try {
      final result = await getNotificationByUserIdUsecase(event.uid);
      result.fold(
          (failure) => emit(GetNotificationsFailed(message: failure.message)),
          (success) {
        _notifications = success;
        emit(GetNotificationsSuccess(notifications: success));
      });
    } catch (e) {
      emit(GetNotificationsFailed(message: "Error: ${e.toString()}"));
    }
  }

  Future<void> _geleteNotificationsByUserId(DeleteNotificationsByUserId event,
      Emitter<NotificationState> emit) async {
    emit(const DeleteNotificationsLoading());
    try {
      final result = await deleteNotificationsByUserIdUsecase(event.uid);
      result.fold(
          (failure) =>
              emit(DeleteNotificationsFailed(message: failure.message)),
          (success) {
        _notifications.clear();
        emit(DeleteNotificationsSuccess(message: success));
      });
    } catch (e) {
      emit(DeleteNotificationsFailed(message: "Error: ${e.toString()}"));
    }
  }
}
