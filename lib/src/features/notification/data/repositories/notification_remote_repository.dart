import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/notification/data/datasources/remote/notification_remote_datasource.dart';
import 'package:cosphere/src/features/notification/data/models/mappers/notification_mappers.dart';
import 'package:cosphere/src/features/notification/data/models/notification_api_model.dart';
import 'package:cosphere/src/features/notification/domain/entities/notification.dart';
import 'package:cosphere/src/features/notification/domain/repositories/notification_repository.dart';
import 'package:dartz/dartz.dart';

class NotificationRemoteRepository implements NotificationRepository {
  final NotificationRemoteDatasource notificationDatasource;

  NotificationRemoteRepository({required this.notificationDatasource});
  @override
  Future<Either<Failure, List<NotificationEntity>>> getNotificationsByUserId(
      String uid) async {
    try {
      final List<NotificationApiModel> notifications =
          await notificationDatasource.getNotificationsByUserId(uid);
      return Right(notifications
          .map((notification) => notification.toDomain())
          .toList());
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, String>> deleteAllNotificationsByUserId(
      String uid) async {
    try {
      final String success =
          await notificationDatasource.deleteAllNotificationsByUserId(uid);
      return Right(success);
    } catch (e) {
      return Left(Failure(message: e.toString()));
    }
  }
}
