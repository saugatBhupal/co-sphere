import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/notification/domain/entities/notification.dart';
import 'package:cosphere/src/features/notification/domain/repositories/notification_repository.dart';
import 'package:dartz/dartz.dart';

class GetNotificationByUserIdUsecase
    implements UsecaseWithParams<List<NotificationEntity>, String> {
  final NotificationRepository notificationRepository;

  GetNotificationByUserIdUsecase({required this.notificationRepository});

  @override
  Future<Either<Failure, List<NotificationEntity>>> call(String params) {
    return notificationRepository.getNotificationsByUserId(params);
  }
}
