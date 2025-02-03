import 'package:json_annotation/json_annotation.dart';
import 'package:cosphere/src/core/models/remote/user_api_model.dart';

@JsonSerializable()
class SignInResponseDto {
  final bool success;
  final String message;
  final UserApiModel user;
  final String token;

  SignInResponseDto({
    required this.success,
    required this.message,
    required this.user,
    required this.token,
  });

  factory SignInResponseDto.fromJson(Map<String, dynamic> json) {
    return SignInResponseDto(
      success: json['success'] as bool,
      message: json['message'] as String,
      user: UserApiModel.fromJson(json['data']['user'] as Map<String, dynamic>),
      token: json['data']['token'] as String,
    );
  }

  Map<String, dynamic> toJson() => {
        'success': success,
        'message': message,
        'user': user.toJson(),
        'token': token,
      };
}
