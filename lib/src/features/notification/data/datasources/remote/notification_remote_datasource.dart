import 'package:cosphere/src/features/notification/data/models/notification_api_model.dart';

abstract interface class NotificationRemoteDatasource {
  Future<List<NotificationApiModel>> getNotificationsByUserId(String uid);
  Future<String> deleteAllNotificationsByUserId(String uid);
}
