import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/profile/domain/entities/reviews.dart';
import 'package:cosphere/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:cosphere/src/features/profile/domain/usecases/get_review_by_id_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

import 'get_review_by_id_usecase_profile_test.mocks.dart';

@GenerateMocks([ProfileRepository])
void main() {
  late MockProfileRepository mockProfileRepository;
  late GetUserReviewByIdUsecase getReviewByIdUsecase;

  setUp(() {
    mockProfileRepository = MockProfileRepository();
    getReviewByIdUsecase =
        GetUserReviewByIdUsecase(profileRepository: mockProfileRepository);
  });

  final reviewId = const Uuid().v4();

  test('should return reviews details of the id', () async {
    final reviewLst = Reviews.initial();

    when(mockProfileRepository.getReviewById(reviewId))
        .thenAnswer((_) async => Right(reviewLst));

    final result = await getReviewByIdUsecase(reviewId);

    expect(result, Right(reviewLst));
    verify(mockProfileRepository.getReviewById(reviewId)).called(1);
    verifyNoMoreInteractions(mockProfileRepository);
  });

  test('should return Failure when an error occurs', () async {
    const failure = Failure(message: "Failed to add reviews");

    when(mockProfileRepository.getReviewById(reviewId))
        .thenAnswer((_) async => const Left(failure));

    final result = await getReviewByIdUsecase(reviewId);

    expect(result, const Left(failure));
    verify(mockProfileRepository.getReviewById(reviewId)).called(1);
    verifyNoMoreInteractions(mockProfileRepository);
  });
}
