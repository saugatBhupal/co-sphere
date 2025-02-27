import 'package:json_annotation/json_annotation.dart';

part 'apply_job_req_dto.g.dart';

@JsonSerializable()
class ApplyJobReqDto {
  final String userId;
  final String projectId;

  ApplyJobReqDto({required this.userId, required this.projectId});

  factory ApplyJobReqDto.fromJson(Map<String, dynamic> json) =>
      _$ApplyJobReqDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ApplyJobReqDtoToJson(this);
}
