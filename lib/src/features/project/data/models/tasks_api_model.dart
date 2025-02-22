import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/models/remote/user_api_model.dart';
import 'package:cosphere/src/core/utils/enum_mapper.dart';

class TasksApiModel {
  final String id;
  final String taskName;
  final String taskDescription;
  final DateTime deadline;
  final Status status;
  final DateTime createdDate;
  final DateTime completionDate;
  final CompletionType completionType;
  final List<UserApiModel> members;

  TasksApiModel({
    required this.id,
    required this.taskName,
    required this.taskDescription,
    required this.deadline,
    required this.status,
    required this.createdDate,
    required this.completionDate,
    required this.completionType,
    required this.members,
  });

  factory TasksApiModel.fromJson(Map<String, dynamic> json) {
    return TasksApiModel(
      id: json['_id'] as String? ?? '',
      taskName: json['taskName'] as String? ?? '',
      taskDescription: json['taskDescription'] as String? ?? '',
      deadline: json['deadline'] != null
          ? DateTime.parse(json['deadline'])
          : DateTime(1970, 1, 1),
      status: StatusExtension.fromDatabaseValue(json["status"]),
      createdDate: json['createdDate'] != null
          ? DateTime.parse(json['createdDate'])
          : DateTime(1970, 1, 1),
      completionDate: json['completionDate'] != null
          ? DateTime.parse(json['completionDate'])
          : DateTime(1970, 1, 1),
      completionType:
          CompletionExtension.fromDatabaseValue(json["completionType"]),
      members: json['members'] != null && json['members'] is List
          ? (json['members'] as List)
              .map((member) => member is Map<String, dynamic>
                  ? UserApiModel.fromJson(member)
                  : UserApiModel.initial().copyWith(uid: member.toString()))
              .toList()
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'taskName': taskName,
      'taskDescription': taskDescription,
      'deadline': deadline.toIso8601String(),
      'status': status.toDatabaseValue(),
      'createdDate': createdDate.toIso8601String(),
      'completionDate': completionDate.toIso8601String(),
      'completionType': completionType.toDatabaseValue(),
      'members': members.map((member) => member.toJson()).toList(),
    };
  }
}
