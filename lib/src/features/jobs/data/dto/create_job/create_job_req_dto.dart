import 'package:cosphere/src/features/jobs/domain/entities/salary.dart';
import 'package:json_annotation/json_annotation.dart';

part 'create_job_req_dto.g.dart';

@JsonSerializable()
class CreateJobReqDto {
  final String jobName;
  final String companyName;
  final String position;
  final String address;
  final String postedBy;
  final List<String> skills;
  final String site;
  final Salary salary;

  CreateJobReqDto({
    required this.jobName,
    required this.companyName,
    required this.position,
    required this.address,
    required this.postedBy,
    required this.skills,
    required this.site,
    required this.salary,
  });
  factory CreateJobReqDto.fromJson(Map<String, dynamic> json) =>
      _$CreateJobReqDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateJobReqDtoToJson(this);
}
