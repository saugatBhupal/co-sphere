import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/profile/data/models/mappers/review_mapper.dart';
import 'package:cosphere/src/features/profile/domain/entities/reviews.dart';
import 'package:cosphere/src/features/project/data/dto/add_review/add_review_req_dto.dart';
import 'package:cosphere/src/features/project/domain/repositories/project_repository.dart';
import 'package:cosphere/src/features/project/domain/usecases/add_review_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

import 'add_review_usecase_test.mocks.dart';

@GenerateMocks([ProjectRepository])
void main() {
  late MockProjectRepository mockProjectRepository;
  late AddReviewUsecase addReviewUsecase;

  setUp(() {
    mockProjectRepository = MockProjectRepository();
    addReviewUsecase =
        AddReviewUsecase(projectRepository: mockProjectRepository);
  });

  final dto = AddReviewReqDto(
      projectId: const Uuid().v4(), reviews: [Reviews.initial().fromDomain()]);

  test('should return reviews of all the members in the project', () async {
    final reviewLst = [Reviews.initial(), Reviews.initial(), Reviews.initial()];

    when(mockProjectRepository.addReview(dto))
        .thenAnswer((_) async => Right(reviewLst));

    final result = await addReviewUsecase(dto);

    expect(result, Right(reviewLst));
    verify(mockProjectRepository.addReview(dto)).called(1);
    verifyNoMoreInteractions(mockProjectRepository);
  });

  test('should return Failure when an error occurs', () async {
    const failure = Failure(message: "Failed to add reviews");

    when(mockProjectRepository.addReview(dto))
        .thenAnswer((_) async => const Left(failure));

    final result = await addReviewUsecase(dto);

    expect(result, const Left(failure));
    verify(mockProjectRepository.addReview(dto)).called(1);
    verifyNoMoreInteractions(mockProjectRepository);
  });
}
