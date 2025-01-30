// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignUpRequestDto _$SignUpRequestDtoFromJson(Map<String, dynamic> json) =>
    SignUpRequestDto(
      email: json['email'] as String,
      fullname: json['fullname'] as String,
      phone: json['phone'] as String,
      dob: json['dob'] as String,
      country: json['country'] as String,
      province: json['province'] as String,
      city: json['city'] as String,
    );

Map<String, dynamic> _$SignUpRequestDtoToJson(SignUpRequestDto instance) =>
    <String, dynamic>{
      'email': instance.email,
      'fullname': instance.fullname,
      'phone': instance.phone,
      'dob': instance.dob,
      'country': instance.country,
      'province': instance.province,
      'city': instance.city,
    };
