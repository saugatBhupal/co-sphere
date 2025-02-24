import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:cosphere/src/core/models/remote/user_api_model.dart';

@JsonSerializable()
class ReviewsApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String id;
  final UserApiModel user;
  final UserApiModel reviewedBy;
  final String review;
  final int rating;

  const ReviewsApiModel({
    required this.id,
    required this.user,
    required this.reviewedBy,
    required this.review,
    required this.rating,
  });

  factory ReviewsApiModel.fromJson(Map<String, dynamic> json) {
    return ReviewsApiModel(
      id: json['_id'] as String? ?? '',
      user: json['user'] is Map<String, dynamic>
          ? UserApiModel.fromJson(json['user'] as Map<String, dynamic>)
          : UserApiModel.initial().copyWith(uid: json['user']),
      reviewedBy: json['reviewedBy'] is Map<String, dynamic>
          ? UserApiModel.fromJson(json['reviewedBy'] as Map<String, dynamic>)
          : UserApiModel.initial().copyWith(uid: json['user']),
      review: json['review'] as String? ?? '',
      rating: json['rating'] as int? ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'user': user.toJson(),
      'reviewedBy': reviewedBy.toJson(),
      'review': review,
      'rating': rating,
    };
  }

  factory ReviewsApiModel.initial() {
    return ReviewsApiModel(
      id: '',
      user: UserApiModel.initial(),
      reviewedBy: UserApiModel.initial(),
      review: '',
      rating: 1,
    );
  }

  ReviewsApiModel copyWith({
    String? id,
    UserApiModel? user,
    UserApiModel? reviewedBy,
    String? review,
    int? rating,
  }) {
    return ReviewsApiModel(
      id: id ?? this.id,
      user: user ?? this.user,
      reviewedBy: reviewedBy ?? this.reviewedBy,
      review: review ?? this.review,
      rating: rating ?? this.rating,
    );
  }

  @override
  List<Object> get props => [id, user, review, rating, reviewedBy];
}
