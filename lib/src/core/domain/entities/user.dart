import 'package:cosphere/src/features/profile/domain/entities/skill.dart';
import 'package:equatable/equatable.dart';

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
    String? skillName,
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
      skills: skillName != null
          ? [...?skills, Skill.initial().copyWith(name: skillName)]
          : skills,
    );
  }

  @override
  List<Object?> get props => [uid, email, fullname, dob, country, password];
}
