import 'dart:convert';
import 'package:cosphere/src/features/profile/data/models/skill_api_model.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';

part 'user_api_model.g.dart';

@JsonSerializable()
class UserApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String uid;
  final String fullname;
  final String? profileImage;
  final String email;
  final String phone;
  final String? password;
  final bool verified;
  final DateTime dob;
  final String country;
  final String province;
  final String city;
  final List<SkillApiModel>? skills;
  final String? about;
  final String? overview;
  final DateTime? createdAt;

  const UserApiModel({
    required this.uid,
    required this.fullname,
    this.profileImage,
    required this.email,
    required this.phone,
    this.password,
    required this.verified,
    required this.dob,
    required this.country,
    required this.province,
    required this.city,
    this.skills,
    this.about,
    this.overview,
    this.createdAt,
  });

  factory UserApiModel.fromJson(Map<String, dynamic> json) {
    return UserApiModel(
      uid: json['_id'] as String? ?? json['sender'] as String? ?? '',
      fullname: json['fullname'] as String? ?? 'Unknown',
      profileImage: json['profileImage'] as String?,
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      password: json['password'] as String?,
      verified: json['verified'] as bool? ?? false,
      dob: json['dob'] != null
          ? DateFormat('dd-MM-yyyy').parse(json['dob'])
          : DateTime(01 - 01 - 1970),
      country: json['country'] as String? ?? 'Unknown',
      province: json['province'] as String? ?? 'Unknown',
      city: json['city'] as String? ?? 'Unknown',
      skills: (json['skills'] as List<dynamic>?)
          ?.map(
              (skill) => SkillApiModel.fromJson(skill as Map<String, dynamic>))
          .toList(),
      about: json['about'] as String? ?? 'Unknown',
      overview: json['overview'] as String? ?? 'Unknown',
      createdAt: json['createdAt'] != null
          ? DateTime.parse(json['createdAt'])
          : DateTime(1970, 1, 1),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': uid,
      'fullname': fullname,
      'profileImage': profileImage,
      'email': email,
      'phone': phone,
      'password': password,
      'verified': verified,
      'dob': DateFormat('dd-MM-yyyy').format(dob),
      'country': country,
      'province': province,
      'city': city,
      'about': about,
      'overview': overview,
      'createdAt': createdAt?.toIso8601String(),
    };
  }

  factory UserApiModel.fromString(String jsonString) {
    final Map<String, dynamic> json = jsonDecode(jsonString);
    return UserApiModel.initial().copyWith(
      uid: json['sender'] as String? ?? json['member'] as String? ?? '',
    );
  }

  factory UserApiModel.initial() {
    return UserApiModel(
      uid: '',
      fullname: 'Unknown',
      profileImage: null,
      email: '',
      phone: '',
      password: '',
      verified: false,
      dob: DateTime.utc(2000, 1, 1),
      country: 'Unknown',
      province: 'Unknown',
      city: 'Unknown',
      skills: const [],
      about: 'Unknown',
      overview: 'Unknown',
      createdAt: DateTime.utc(2000, 1, 1),
    );
  }
  UserApiModel copyWith({
    String? uid,
    String? fullname,
    String? profileImage,
    String? email,
    String? phone,
    String? password,
    bool? verified,
    DateTime? dob,
    String? country,
    String? province,
    String? city,
    List<SkillApiModel>? skills,
    String? about,
    String? overview,
    DateTime? createdAt,
  }) {
    return UserApiModel(
      uid: uid ?? this.uid,
      fullname: fullname ?? this.fullname,
      profileImage: profileImage ?? this.profileImage,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      password: password ?? this.password,
      verified: verified ?? this.verified,
      dob: dob ?? this.dob,
      country: country ?? this.country,
      province: province ?? this.province,
      city: city ?? this.city,
      skills: skills ?? this.skills,
      about: about ?? this.about,
      overview: overview ?? this.about,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  @override
  List<Object?> get props => [uid, email, fullname, dob, country, password];
}
