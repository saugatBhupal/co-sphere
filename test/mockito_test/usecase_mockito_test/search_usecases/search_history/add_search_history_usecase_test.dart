import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/search/data/dto/add_search_history_req_dto/add_search_history_req_dto.dart';
import 'package:cosphere/src/features/search/domain/repositories/search_repository.dart';
import 'package:cosphere/src/features/search/domain/usecases/add_search_history_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';
import 'add_search_history_usecase_test.mocks.dart';

@GenerateMocks([SearchRepository])
void main() {
  late MockSearchRepository mockSearchRepository;
  late AddSearchHistoryUsecase addSearchHistoryUsecase;

  setUp(() {
    mockSearchRepository = MockSearchRepository();
    addSearchHistoryUsecase =
        AddSearchHistoryUsecase(searchRepository: mockSearchRepository);
  });

  final dto =
      AddSearchHistoryReqDto(userId: const Uuid().v4(), query: "Job Name");

  test('should send search query to the API', () async {
    when(mockSearchRepository.addSearchHistory(dto))
        .thenAnswer((_) async => const Right(null));

    final result = await addSearchHistoryUsecase(dto);

    expect(result, const Right(null));

    verify(mockSearchRepository.addSearchHistory(dto)).called(1);
    verifyNoMoreInteractions(mockSearchRepository);
  });

  test('should return a failure when repository call fails', () async {
    const failure = Failure(message: "Something went wrong");
    when(mockSearchRepository.addSearchHistory(dto))
        .thenAnswer((_) async => const Left(failure));

    final result = await addSearchHistoryUsecase(dto);

    expect(result, const Left(failure));
    verify(mockSearchRepository.addSearchHistory(dto)).called(1);
    verifyNoMoreInteractions(mockSearchRepository);
  });
}
