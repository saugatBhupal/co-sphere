// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_experience_req_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddExperienceReqDto _$AddExperienceReqDtoFromJson(Map<String, dynamic> json) =>
    AddExperienceReqDto(
      email: json['email'] as String,
      position: json['position'] as String,
      organization: json['organization'] as String,
      status: json['status'] as String,
      from: DateTime.parse(json['from'] as String),
      to: DateTime.parse(json['to'] as String),
    );

Map<String, dynamic> _$AddExperienceReqDtoToJson(
        AddExperienceReqDto instance) =>
    <String, dynamic>{
      'email': instance.email,
      'position': instance.position,
      'organization': instance.organization,
      'status': instance.status,
      'from': instance.from.toIso8601String(),
      'to': instance.to.toIso8601String(),
    };
