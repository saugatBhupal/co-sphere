// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_task_req_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateTaskReqDto _$CreateTaskReqDtoFromJson(Map<String, dynamic> json) =>
    CreateTaskReqDto(
      projectId: json['projectId'] as String,
      taskName: json['taskName'] as String,
      taskDescription: json['taskDescription'] as String,
      deadline: DateTime.parse(json['deadline'] as String),
      members:
          (json['members'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CreateTaskReqDtoToJson(CreateTaskReqDto instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'taskName': instance.taskName,
      'taskDescription': instance.taskDescription,
      'deadline': instance.deadline.toIso8601String(),
      'members': instance.members,
    };
