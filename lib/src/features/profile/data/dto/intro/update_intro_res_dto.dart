import 'package:json_annotation/json_annotation.dart';

part 'update_intro_res_dto.g.dart';

@JsonSerializable()
class UpdateIntroResDto {
  final String? about;
  final String? overview;

  UpdateIntroResDto({required this.about, required this.overview});
  factory UpdateIntroResDto.fromJson(Map<String, dynamic> json) =>
      _$UpdateIntroResDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateIntroResDtoToJson(this);
}
