import 'package:equatable/equatable.dart';
import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:uuid/uuid.dart';

class Reviews extends Equatable {
  final String id;
  final User user;
  final String review;
  final int rating;

  const Reviews({
    required this.id,
    required this.user,
    required this.review,
    required this.rating,
  });

  @override
  List<Object> get props => [user, review, rating];

  factory Reviews.initial() {
    return Reviews(
      id: const Uuid().v4(),
      user: User.initial(),
      review: '',
      rating: 1,
    );
  }

  Reviews copyWith({
    String? id,
    User? user,
    String? review,
    int? rating,
  }) {
    return Reviews(
      id: id ?? this.id,
      user: user ?? this.user,
      review: review ?? this.review,
      rating: rating ?? this.rating,
    );
  }
}
