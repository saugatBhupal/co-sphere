import 'package:json_annotation/json_annotation.dart';

part 'sign_up_request_dto.g.dart';

@JsonSerializable()
class SignUpRequestDto {
  final String email;
  final String fullname;
  final String phone;
  final String dob;
  final String country;
  final String province;
  final String city;

  SignUpRequestDto({
    required this.email,
    required this.fullname,
    required this.phone,
    required this.dob,
    required this.country,
    required this.province,
    required this.city,
  });

  const SignUpRequestDto.initial()
      : email = '',
        fullname = '',
        phone = '',
        dob = '',
        country = '',
        province = '',
        city = '';

  SignUpRequestDto copyWith({
    String? email,
    String? fullname,
    String? phone,
    String? dob,
    String? country,
    String? province,
    String? city,
    String? password,
  }) {
    return SignUpRequestDto(
      email: email ?? this.email,
      fullname: fullname ?? this.fullname,
      phone: phone ?? this.phone,
      dob: dob ?? this.dob,
      country: country ?? this.country,
      province: province ?? this.province,
      city: city ?? this.city,
    );
  }

  factory SignUpRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SignUpRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SignUpRequestDtoToJson(this);
}
