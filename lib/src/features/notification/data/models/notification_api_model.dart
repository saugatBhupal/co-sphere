import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/utils/enum_mapper.dart';
import 'package:equatable/equatable.dart';

class NotificationApiModel extends Equatable {
  final String id;
  final NotificationType notificationType;
  final String data;
  final String chatData;
  final DateTime date;

  const NotificationApiModel({
    required this.id,
    required this.notificationType,
    required this.data,
    required this.chatData,
    required this.date,
  });

  factory NotificationApiModel.fromJson(Map<String, dynamic> json) {
    return NotificationApiModel(
      id: json['_id'] as String? ?? '',
      notificationType:
          NotificationExtension.fromDatabaseValue(json['notificationType']),
      data: json['data'] as String? ?? '',
      chatData: json['chatData'] as String? ?? '',
      date: json['date'] != null
          ? DateTime.parse(json['date'])
          : DateTime(1970, 1, 1),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'notificationType': notificationType.toDatabaseValue(),
      'data': data,
      'chatData': chatData,
      'date': date.toIso8601String(),
    };
  }

  @override
  List<Object> get props {
    return [id, notificationType, data, chatData, date];
  }
}
