import 'package:equatable/equatable.dart';

class User extends Equatable {
  final String uid;
  final String fullname;
  final String? profileImage;
  final String email;
  final String phone;
  final String? password;
  final bool verified;
  final String dob;
  final String country;
  final String province;
  final String city;

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
  });

  factory User.initial() {
    return const User(
      uid: '',
      fullname: 'Unknown',
      profileImage: null,
      email: '',
      phone: '',
      password: '',
      verified: false,
      dob: '2000-01-01',
      country: 'Unknown',
      province: 'Unknown',
      city: 'Unknown',
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
    String? dob,
    String? country,
    String? province,
    String? city,
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
    );
  }

  @override
  List<Object?> get props => [uid, email, fullname, dob, country, password];
}
