import 'package:cosphere/src/core/constants/app_enums.dart';
import 'package:cosphere/src/core/utils/enum_mapper.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class CompleteProjectReqDto {
  final String projectId;
  final CompletionType completionType;

  CompleteProjectReqDto({
    required this.projectId,
    required this.completionType,
  });

  factory CompleteProjectReqDto.fromJson(Map<String, dynamic> json) {
    return CompleteProjectReqDto(
      projectId: json['projectId'] as String? ?? '',
      completionType:
          CompletionExtension.fromDatabaseValue(json["completionType"]),
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'projectId': projectId,
      'completionType': completionType.toDatabaseValue(),
    };
  }
}
