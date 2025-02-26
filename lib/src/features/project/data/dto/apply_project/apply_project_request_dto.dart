import 'package:json_annotation/json_annotation.dart';

part 'apply_project_request_dto.g.dart';

@JsonSerializable()
class ApplyProjectRequestDto {
  final String userId;
  final String projectId;

  ApplyProjectRequestDto({required this.userId, required this.projectId});

  factory ApplyProjectRequestDto.fromJson(Map<String, dynamic> json) =>
      _$ApplyProjectRequestDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ApplyProjectRequestDtoToJson(this);
}
