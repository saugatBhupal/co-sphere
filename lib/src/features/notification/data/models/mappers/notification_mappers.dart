import 'package:cosphere/src/features/notification/data/models/notification_api_model.dart';
import 'package:cosphere/src/features/notification/domain/entities/notification.dart';

extension NotificationApiModelMappers on NotificationApiModel {
  Notification toDomain() => Notification.initial().copyWith(
        id: id,
        notificationType: notificationType,
        data: data,
        chatData: chatData,
        date: date,
      );
}

extension NotificationMappers on Notification {
  NotificationApiModel toDomain() => NotificationApiModel(
        id: id,
        notificationType: notificationType,
        data: data,
        chatData: chatData,
        date: date,
      );
}
