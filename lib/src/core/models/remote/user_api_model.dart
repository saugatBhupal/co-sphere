import 'package:cosphere/src/features/profile/data/models/skill_api_model.dart';
import 'package:equatable/equatable.dart';
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
      uid: json['_id'] as String? ?? '',
      fullname: json['fullname'] as String? ?? 'Unknown',
      profileImage: json['profileImage'] as String?,
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      password: json['password'] as String?,
      verified: json['verified'] as bool? ?? false,
      dob: json['dob'] != null
          ? DateTime.parse(json['dob'])
          : DateTime(1970, 1, 1),
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
      'dob': dob.toIso8601String(),
      'country': country,
      'province': province,
      'city': city,
      'about': about,
      'overview': overview,
      'createdAt': createdAt!.toIso8601String(),
    };
  }

  @override
  List<Object?> get props => [uid, email, fullname, dob, country, password];
}
