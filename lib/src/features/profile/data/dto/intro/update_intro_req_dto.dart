import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'update_intro_req_dto.g.dart';

@JsonSerializable()
class UpdateIntroReqDto extends Equatable {
  final String email;
  final String? about;
  final String? overview;

  const UpdateIntroReqDto({
    required this.email,
    required this.about,
    required this.overview,
  });
  factory UpdateIntroReqDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateIntroReqDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateIntroReqDtoToJson(this);
  @override
  List<Object> get props => [email];
}
