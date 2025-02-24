import 'package:equatable/equatable.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:uuid/uuid.dart';

class Reviews extends Equatable {
  final String id;
  final User user;
  final User reviewedBy;
  final String review;
  final int rating;

  const Reviews({
    required this.id,
    required this.user,
    required this.reviewedBy,
    required this.review,
    required this.rating,
  });

  @override
  List<Object> get props => [user, review, rating];

  factory Reviews.initial() {
    return Reviews(
      id: const Uuid().v4(),
      user: User.initial(),
      reviewedBy: User.initial(),
      review: '',
      rating: 1,
    );
  }

  Reviews copyWith({
    String? id,
    User? user,
    User? reviewedBy,
    String? review,
    int? rating,
  }) {
    return Reviews(
      id: id ?? this.id,
      user: user ?? this.user,
      reviewedBy: reviewedBy ?? this.reviewedBy,
      review: review ?? this.review,
      rating: rating ?? this.rating,
    );
  }
}
