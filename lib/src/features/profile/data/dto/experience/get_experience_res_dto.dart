import 'package:cosphere/src/features/profile/data/models/experience_api_model.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class GetExperienceResDto {
  final String? overview;
  final List<ExperienceApiModel> experience;

  GetExperienceResDto({
    this.overview,
    required this.experience,
  });
  factory GetExperienceResDto.fromJson(Map<String, dynamic> json) {
    return GetExperienceResDto(
      overview: json['data']['overview'] != null
          ? json['data']['overview'] as String
          : "",
      experience: (json['data']['experience'] as List<dynamic>)
          .map((e) => ExperienceApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        'overview': overview,
        'experience': experience.map((experience) => experience.toJson()),
      };
}
