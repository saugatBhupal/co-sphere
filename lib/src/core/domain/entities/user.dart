import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String uid;
  final String email;
  final String fullname;
  final String? profileImage;
  final String phone;
  final String dob;
  final String country;
  final String province;
  final String city;
  final String password;
  final bool verified;

  const User({
    required this.uid,
    required this.email,
    required this.fullname,
    required this.phone,
    required this.dob,
    required this.country,
    required this.province,
    required this.city,
    required this.password,
    required this.verified,
    this.profileImage,
  });

  User copyWith({
    String? uid,
    String? email,
    String? fullname,
    String? phone,
    String? dob,
    String? country,
    String? province,
    String? city,
    String? password,
    bool? verified,
  }) {
    return User(
      uid: uid ?? this.uid,
      email: email ?? this.email,
      fullname: fullname ?? this.fullname,
      phone: phone ?? this.phone,
      dob: dob ?? this.dob,
      country: country ?? this.country,
      province: province ?? this.province,
      city: city ?? this.city,
      password: password ?? this.password,
      verified: verified ?? this.verified,
    );
  }

  @override
  List<Object?> get props => [uid, email, fullname, dob, country, password];
}
