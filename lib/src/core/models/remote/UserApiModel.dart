import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

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
  final String dob;
  final String country;
  final String province;
  final String city;

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
      dob: json['dob'] as String? ?? '',
      country: json['country'] as String? ?? 'Unknown',
      province: json['province'] as String? ?? 'Unknown',
      city: json['city'] as String? ?? 'Unknown',
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
      'dob': dob,
      'country': country,
      'province': province,
      'city': city,
    };
  }

  @override
  List<Object?> get props => [uid, email, fullname, dob, country, password];
}
