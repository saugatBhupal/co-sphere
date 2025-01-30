import 'package:cosphere/src/core/models/remote/UserApiModel.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_in_response_dto.g.dart';

@JsonSerializable()
class SignInResponseDto {
  final bool success;
  final String message;
  final UserApiModel data;

  SignInResponseDto({
    required this.success,
    required this.message,
    required this.data,
  });
  factory SignInResponseDto.fromJson(Map<String, dynamic> json) =>
      _$SignInResponseDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SignInResponseDtoToJson(this);
}
