// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_education_req_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddEducationReqDto _$AddEducationReqDtoFromJson(Map<String, dynamic> json) =>
    AddEducationReqDto(
      email: json['email'] as String,
      degree: json['degree'] as String,
      organization: json['organization'] as String,
      from: DateTime.parse(json['from'] as String),
      to: json['to'] == null ? null : DateTime.parse(json['to'] as String),
    );

Map<String, dynamic> _$AddEducationReqDtoToJson(AddEducationReqDto instance) =>
    <String, dynamic>{
      'email': instance.email,
      'degree': instance.degree,
      'organization': instance.organization,
      'from': instance.from.toIso8601String(),
      'to': instance.to?.toIso8601String(),
    };
