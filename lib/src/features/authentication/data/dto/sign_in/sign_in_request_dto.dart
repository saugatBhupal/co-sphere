import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'sign_in_request_dto.g.dart';

@JsonSerializable()
class SigninRequestDto extends Equatable {
  final String email;
  final String password;

  const SigninRequestDto({
    required this.email,
    required this.password,
  });

  const SigninRequestDto.initial()
      : email = '',
        password = '';
  @override
  List<Object?> get props => [email, password];

  factory SigninRequestDto.fromJson(Map<String, dynamic> json) =>
      _$SigninRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$SigninRequestDtoToJson(this);
}
