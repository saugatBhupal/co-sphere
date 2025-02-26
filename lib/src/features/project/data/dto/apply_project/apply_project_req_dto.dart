import 'package:json_annotation/json_annotation.dart';

part 'apply_project_req_dto.g.dart';

@JsonSerializable()
class ApplyProjectReqDto {
  final String userId;
  final String projectId;

  ApplyProjectReqDto({required this.userId, required this.projectId});

  factory ApplyProjectReqDto.fromJson(Map<String, dynamic> json) =>
      _$ApplyProjectReqDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ApplyProjectReqDtoToJson(this);
}
