// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'otp_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OtpRequestDto _$OtpRequestDtoFromJson(Map<String, dynamic> json) =>
    OtpRequestDto(
      type: $enumDecode(_$OtpTypeEnumMap, json['type']),
      email: json['email'] as String,
      otp: json['otp'] as String,
    );

Map<String, dynamic> _$OtpRequestDtoToJson(OtpRequestDto instance) =>
    <String, dynamic>{
      'type': _$OtpTypeEnumMap[instance.type]!,
      'email': instance.email,
      'otp': instance.otp,
    };

const _$OtpTypeEnumMap = {
  OtpType.verifyUser: 'verifyUser',
  OtpType.verifyPassword: 'verifyPassword',
};
