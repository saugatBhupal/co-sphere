import 'package:json_annotation/json_annotation.dart';

part 'create_password_request_dto.g.dart';

@JsonSerializable()
class CreatePasswordRequestDto {
  final String email;
  final String password;

  CreatePasswordRequestDto({
    required this.email,
    required this.password,
  });
  factory CreatePasswordRequestDto.fromJson(Map<String, dynamic> json) =>
      _$CreatePasswordRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreatePasswordRequestDtoToJson(this);
}
