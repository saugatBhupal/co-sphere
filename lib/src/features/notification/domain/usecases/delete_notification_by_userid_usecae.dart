import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/notification/domain/repositories/notification_repository.dart';
import 'package:dartz/dartz.dart';

class DeleteNotificationByUserIdUsecae
    implements UsecaseWithParams<String, String> {
  final NotificationRepository notificationRepository;

  DeleteNotificationByUserIdUsecae({required this.notificationRepository});

  @override
  Future<Either<Failure, String>> call(String params) {
    return notificationRepository.deleteAllNotificationsByUserId(params);
  }
}
