import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/profile/domain/entities/reviews.dart';
import 'package:cosphere/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:cosphere/src/features/profile/domain/usecases/get_reviews_by_user_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

import 'get_reviews_by_user_usecase_test.mocks.dart';

@GenerateMocks([ProfileRepository])
void main() {
  late MockProfileRepository mockProfileRepository;
  late GetReviewsByUserUsecase getReviewsByUserUsecase;

  setUp(() {
    mockProfileRepository = MockProfileRepository();
    getReviewsByUserUsecase =
        GetReviewsByUserUsecase(profileRepository: mockProfileRepository);
  });

  final userId = const Uuid().v4();

  test('should return List of reviews details of the user', () async {
    final reviewLst = [Reviews.initial(), Reviews.initial()];

    when(mockProfileRepository.getReviewsByUser(userId))
        .thenAnswer((_) async => Right(reviewLst));

    final result = await getReviewsByUserUsecase(userId);

    expect(result, Right(reviewLst));
    verify(mockProfileRepository.getReviewsByUser(userId)).called(1);
    verifyNoMoreInteractions(mockProfileRepository);
  });

  test('should return Failure when an error occurs', () async {
    const failure = Failure(message: "Failed to add reviews");

    when(mockProfileRepository.getReviewsByUser(userId))
        .thenAnswer((_) async => const Left(failure));

    final result = await getReviewsByUserUsecase(userId);

    expect(result, const Left(failure));
    verify(mockProfileRepository.getReviewsByUser(userId)).called(1);
    verifyNoMoreInteractions(mockProfileRepository);
  });
}
