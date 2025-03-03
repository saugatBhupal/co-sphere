import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/notification/domain/entities/notification.dart';
import 'package:dartz/dartz.dart';

abstract interface class NotificationRepository {
  Future<Either<Failure, List<NotificationEntity>>> getNotificationsByUserId(
      String uid);
  Future<Either<Failure, String>> deleteAllNotificationsByUserId(String uid);
}
