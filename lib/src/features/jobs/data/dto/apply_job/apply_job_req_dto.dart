import 'package:json_annotation/json_annotation.dart';

part 'apply_job_req_dto.g.dart';

@JsonSerializable()
class ApplyJobReqDto {
  final String userId;
  final String jobId;

  ApplyJobReqDto({required this.userId, required this.jobId});

  factory ApplyJobReqDto.fromJson(Map<String, dynamic> json) =>
      _$ApplyJobReqDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ApplyJobReqDtoToJson(this);
}
