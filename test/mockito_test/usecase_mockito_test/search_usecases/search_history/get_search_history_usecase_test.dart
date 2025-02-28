import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/search/domain/entities/search.dart';
import 'package:cosphere/src/features/search/domain/repositories/search_repository.dart';
import 'package:cosphere/src/features/search/domain/usecases/get_search_history_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

import 'get_search_history_usecase_test.mocks.dart';

@GenerateMocks([SearchRepository])
void main() {
  late MockSearchRepository mockSearchRepository;
  late GetSearchHistoryUsecase getSearchHistoryUsecase;

  setUp(() {
    mockSearchRepository = MockSearchRepository();
    getSearchHistoryUsecase =
        GetSearchHistoryUsecase(searchRepository: mockSearchRepository);
  });
  final String uid = const Uuid().v4();
  test('should return search history of the User', () async {
    final searchResults = [
      Search.initial(),
      Search.initial(),
      Search.initial(),
    ];

    when(mockSearchRepository.getSearchHistory(uid))
        .thenAnswer((_) async => Right(searchResults));

    final result = await getSearchHistoryUsecase(uid);

    expect(result, Right(searchResults));
    verify(mockSearchRepository.getSearchHistory(uid)).called(1);
    verifyNoMoreInteractions(mockSearchRepository);
  });

  test('should return Failure when an error occurs', () async {
    const failure = Failure(message: "Invalid Request");
    when(mockSearchRepository.getSearchHistory(uid))
        .thenAnswer((_) async => const Left(failure));

    final result = await getSearchHistoryUsecase(uid);

    expect(result, const Left(failure));
    verify(mockSearchRepository.getSearchHistory(uid)).called(1);
    verifyNoMoreInteractions(mockSearchRepository);
  });
}
