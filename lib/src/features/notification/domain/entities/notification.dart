import 'package:equatable/equatable.dart';
import 'package:uuid/uuid.dart';

import 'package:cosphere/src/core/constants/app_enums.dart';

class NotificationEntity extends Equatable {
  final String id;
  final NotificationType notificationType;
  final String data;
  final String chatData;
  final DateTime date;

  const NotificationEntity({
    required this.id,
    required this.notificationType,
    required this.data,
    required this.chatData,
    required this.date,
  });

  factory NotificationEntity.initial() {
    return NotificationEntity(
      id: const Uuid().v4(),
      notificationType: NotificationType.chat,
      data: '',
      chatData: '',
      date: DateTime.now(),
    );
  }
  NotificationEntity copyWith({
    String? id,
    NotificationType? notificationType,
    String? data,
    String? chatData,
    DateTime? date,
  }) {
    return NotificationEntity(
      id: id ?? this.id,
      notificationType: notificationType ?? this.notificationType,
      data: data ?? this.data,
      chatData: chatData ?? this.chatData,
      date: date ?? this.date,
    );
  }

  @override
  List<Object> get props {
    return [id, notificationType, data, chatData, date];
  }
}
