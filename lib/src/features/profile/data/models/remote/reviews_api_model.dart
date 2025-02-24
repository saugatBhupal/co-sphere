import 'package:equatable/equatable.dart';
import 'package:cosphere/src/core/models/remote/user_api_model.dart';
import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class ReviewsApiModel extends Equatable {
  @JsonKey(name: '_id')
  final String id;
  final UserApiModel user;
  final String review;
  final int rating;

  const ReviewsApiModel({
    required this.id,
    required this.user,
    required this.review,
    required this.rating,
  });

  factory ReviewsApiModel.fromJson(Map<String, dynamic> json) {
    return ReviewsApiModel(
      id: json['_id'] as String? ?? '',
      user: json['user'] is Map<String, dynamic>
          ? UserApiModel.fromJson(json['user'] as Map<String, dynamic>)
          : UserApiModel.initial().copyWith(uid: json['user']),
      review: json['review'] as String? ?? '',
      rating: json['rating'] as int? ?? 1,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'user': user.toJson(),
      'review': review,
      'rating': rating,
    };
  }

  @override
  List<Object> get props => [id, user, review, rating];
}
