import 'package:cosphere/src/features/profile/data/models/remote/reviews_api_model.dart';
import 'package:json_annotation/json_annotation.dart';

part 'add_review_req_dto.g.dart';

@JsonSerializable()
class AddReviewReqDto {
  final String projectId;
  final List<ReviewsApiModel> reviews;

  AddReviewReqDto({
    required this.projectId,
    required this.reviews,
  });
  factory AddReviewReqDto.fromJson(Map<String, dynamic> json) =>
      _$AddReviewReqDtoFromJson(json);

  Map<String, dynamic> toJson() => _$AddReviewReqDtoToJson(this);
}
