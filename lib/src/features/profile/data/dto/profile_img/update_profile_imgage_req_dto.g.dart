// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_imgage_req_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileImgageReqDto _$UpdateProfileImgageReqDtoFromJson(
        Map<String, dynamic> json) =>
    UpdateProfileImgageReqDto(
      media: const FileConverter().fromJson(json['media'] as String?),
      email: json['email'] as String,
    );

Map<String, dynamic> _$UpdateProfileImgageReqDtoToJson(
        UpdateProfileImgageReqDto instance) =>
    <String, dynamic>{
      'media': const FileConverter().toJson(instance.media),
      'email': instance.email,
    };
