import 'package:json_annotation/json_annotation.dart';

part 'hire_user_req_dto.g.dart';

@JsonSerializable()
class HireUserReqDto {
  final String userId;
  final String projectId;

  HireUserReqDto({required this.userId, required this.projectId});

  factory HireUserReqDto.fromJson(Map<String, dynamic> json) =>
      _$HireUserReqDtoFromJson(json);

  Map<String, dynamic> toJson() => _$HireUserReqDtoToJson(this);
}
