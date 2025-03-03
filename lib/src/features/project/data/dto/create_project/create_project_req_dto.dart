import 'package:cosphere/src/features/jobs/domain/entities/salary.dart';
import 'package:cosphere/src/features/project/domain/entities/durations.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_project_req_dto.g.dart';

@JsonSerializable()
class CreateProjectReqDto {
  final String projectName;
  final String companyName;
  final String position;
  final String address;
  final String postedBy;
  final String description;
  final List<String> skills;
  final String site;
  final Salary salary;
  final DurationTime duration;

  CreateProjectReqDto({
    required this.projectName,
    required this.companyName,
    required this.position,
    required this.address,
    required this.postedBy,
    required this.description,
    required this.skills,
    required this.site,
    required this.salary,
    required this.duration,
  });
  factory CreateProjectReqDto.fromJson(Map<String, dynamic> json) =>
      _$CreateProjectReqDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateProjectReqDtoToJson(this);
}
