// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_intro_req_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateIntroReqDto _$UpdateIntroReqDtoFromJson(Map<String, dynamic> json) =>
    UpdateIntroReqDto(
      email: json['email'] as String,
      about: json['about'] as String?,
      overview: json['overview'] as String?,
    );

Map<String, dynamic> _$UpdateIntroReqDtoToJson(UpdateIntroReqDto instance) =>
    <String, dynamic>{
      'email': instance.email,
      'about': instance.about,
      'overview': instance.overview,
    };
