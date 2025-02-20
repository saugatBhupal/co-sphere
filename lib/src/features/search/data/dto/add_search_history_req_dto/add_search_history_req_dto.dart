import 'package:json_annotation/json_annotation.dart';

part 'add_search_history_req_dto.g.dart';

@JsonSerializable()
class AddSearchHistoryReqDto {
  final String userId;
  final String query;

  AddSearchHistoryReqDto({
    required this.userId,
    required this.query,
  });

  factory AddSearchHistoryReqDto.fromJson(Map<String, dynamic> json) =>
      _$AddSearchHistoryReqDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AddSearchHistoryReqDtoToJson(this);
}
