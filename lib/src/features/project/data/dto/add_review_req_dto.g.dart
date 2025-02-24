// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_review_req_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddReviewReqDto _$AddReviewReqDtoFromJson(Map<String, dynamic> json) =>
    AddReviewReqDto(
      projectId: json['projectId'] as String,
      reviews: (json['reviews'] as List<dynamic>)
          .map((e) => ReviewsApiModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$AddReviewReqDtoToJson(AddReviewReqDto instance) =>
    <String, dynamic>{
      'projectId': instance.projectId,
      'reviews': instance.reviews,
    };
