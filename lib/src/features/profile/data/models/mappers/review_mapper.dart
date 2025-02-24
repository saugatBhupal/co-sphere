import 'package:cosphere/src/core/domain/mappers/remote/user_mappers.dart';
import 'package:cosphere/src/features/profile/data/models/remote/reviews_api_model.dart';
import 'package:cosphere/src/features/profile/domain/entities/reviews.dart';

extension ReviewsApiModelExtension on ReviewsApiModel {
  Reviews toDomain() => Reviews(
        id: id,
        user: user.toDomain(),
        reviewedBy: reviewedBy.toDomain(),
        review: review,
        rating: rating,
      );
}

extension ReviewsExtension on Reviews {
  ReviewsApiModel fromDomain() => ReviewsApiModel(
        id: id,
        user: user.toApiModel(),
        reviewedBy: reviewedBy.toApiModel(),
        review: review,
        rating: rating,
      );
}
