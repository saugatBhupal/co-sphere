import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_experience_req_dto.g.dart';

@JsonSerializable()
class AddExperienceReqDto extends Equatable {
  final String email;
  final String position;
  final String organization;
  final String status;
  final DateTime from;
  final DateTime? to;

  const AddExperienceReqDto({
    required this.email,
    required this.position,
    required this.organization,
    required this.status,
    required this.from,
    this.to,
  });
  factory AddExperienceReqDto.fromJson(Map<String, dynamic> json) =>
      _$AddExperienceReqDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AddExperienceReqDtoToJson(this);
  @override
  List<Object> get props {
    return [email, position, status, organization, from];
  }
}
