// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apply_project_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApplyProjectRequestDto _$ApplyProjectRequestDtoFromJson(
        Map<String, dynamic> json) =>
    ApplyProjectRequestDto(
      userId: json['userId'] as String,
      projectId: json['projectId'] as String,
    );

Map<String, dynamic> _$ApplyProjectRequestDtoToJson(
        ApplyProjectRequestDto instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'projectId': instance.projectId,
    };
