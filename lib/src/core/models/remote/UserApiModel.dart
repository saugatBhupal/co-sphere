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
  final String password;
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
    required this.password,
    required this.verified,
    required this.dob,
    required this.country,
    required this.province,
    required this.city,
  });

  factory UserApiModel.fromJson(Map<String, dynamic> json) {
    return UserApiModel(
      uid: json['_id'],
      fullname: json['fullname'],
      profileImage: json['profileImage'],
      email: json['email'],
      phone: json['phone'],
      password: json['password'],
      verified: json['verified'],
      dob: json['dob'],
      country: json['country'],
      province: json['province'],
      city: json['city'],
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
