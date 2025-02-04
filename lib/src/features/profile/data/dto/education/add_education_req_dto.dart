import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_education_req_dto.g.dart';

@JsonSerializable()
class AddEducationReqDto extends Equatable {
  final String email;
  final String degree;
  final String organization;
  final DateTime from;
  final DateTime to;

  const AddEducationReqDto({
    required this.email,
    required this.degree,
    required this.organization,
    required this.from,
    required this.to,
  });
  factory AddEducationReqDto.fromJson(Map<String, dynamic> json) =>
      _$AddEducationReqDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AddEducationReqDtoToJson(this);
  @override
  List<Object> get props {
    return [email, degree, organization, from, to];
  }
}
