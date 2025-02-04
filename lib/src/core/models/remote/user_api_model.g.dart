// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_api_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserApiModel _$UserApiModelFromJson(Map<String, dynamic> json) => UserApiModel(
      uid: json['_id'] as String,
      fullname: json['fullname'] as String,
      profileImage: json['profileImage'] as String?,
      email: json['email'] as String,
      phone: json['phone'] as String,
      password: json['password'] as String?,
      verified: json['verified'] as bool,
      dob: DateTime.parse(json['dob'] as String),
      country: json['country'] as String,
      province: json['province'] as String,
      city: json['city'] as String,
      skills: (json['skills'] as List<dynamic>?)
          ?.map((e) => SkillApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      about: json['about'] as String?,
      overview: json['overview'] as String?,
      createdAt: json['createdAt'] == null
          ? null
          : DateTime.parse(json['createdAt'] as String),
    );

Map<String, dynamic> _$UserApiModelToJson(UserApiModel instance) =>
    <String, dynamic>{
      '_id': instance.uid,
      'fullname': instance.fullname,
      'profileImage': instance.profileImage,
      'email': instance.email,
      'phone': instance.phone,
      'password': instance.password,
      'verified': instance.verified,
      'dob': instance.dob.toIso8601String(),
      'country': instance.country,
      'province': instance.province,
      'city': instance.city,
      'skills': instance.skills,
      'about': instance.about,
      'overview': instance.overview,
      'createdAt': instance.createdAt?.toIso8601String(),
    };
