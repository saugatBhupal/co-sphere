import 'package:json_annotation/json_annotation.dart';

part 'create_task_req_dto.g.dart';

@JsonSerializable()
class CreateTaskReqDto {
  final String projectId;
  final String taskName;
  final String taskDescription;
  final DateTime deadline;
  final List<String> members;

  CreateTaskReqDto({
    required this.projectId,
    required this.taskName,
    required this.taskDescription,
    required this.deadline,
    required this.members,
  });
  factory CreateTaskReqDto.fromJson(Map<String, dynamic> json) =>
      _$CreateTaskReqDtoFromJson(json);

  Map<String, dynamic> toJson() => _$CreateTaskReqDtoToJson(this);
}
