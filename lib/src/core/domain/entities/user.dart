import 'package:cosphere/src/features/profile/domain/entities/skill.dart';
import 'package:equatable/equatable.dart';
import 'package:intl/intl.dart';

class User extends Equatable {
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
  final List<Skill>? skills;
  final String? about;
  final String? overview;
  final DateTime? createdAt;

  const User({
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

  factory User.initial() {
    return User(
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
  User copyWith({
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
    List<Skill>? skills,
    String? about,
    String? overview,
    DateTime? createdAt,
  }) {
    return User(
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

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      uid: json['_id'] as String? ?? '',
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
          ?.map((skill) => Skill.fromJson(skill as Map<String, dynamic>))
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

  @override
  List<Object?> get props => [uid, email, fullname, dob, country, password];
}
