import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:json_annotation/json_annotation.dart';

part 'otp_request_dto.g.dart';

@JsonSerializable()
class OtpRequestDto {
  final OtpType type;
  final String email;
  final String otp;

  OtpRequestDto({
    required this.type,
    required this.email,
    required this.otp,
  });

  factory OtpRequestDto.fromJson(Map<String, dynamic> json) =>
      _$OtpRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$OtpRequestDtoToJson(this);
}
