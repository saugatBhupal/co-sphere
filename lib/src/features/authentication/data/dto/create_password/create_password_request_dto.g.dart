// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_password_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatePasswordRequestDto _$CreatePasswordRequestDtoFromJson(
        Map<String, dynamic> json) =>
    CreatePasswordRequestDto(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$CreatePasswordRequestDtoToJson(
        CreatePasswordRequestDto instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
