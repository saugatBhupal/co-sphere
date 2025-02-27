import 'package:cosphere/src/core/domain/entities/user.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/search/domain/repositories/search_repository.dart';
import 'package:cosphere/src/features/search/domain/usecases/get_users_by_name_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'get_users_usecase_test.mocks.dart';

@GenerateMocks([SearchRepository])
void main() {
  late MockSearchRepository mockSearchRepository; 
  late GetUsersByNameUsecase getUsersByNameUsecase;

  setUp(() {
    mockSearchRepository = MockSearchRepository();
    getUsersByNameUsecase =
        GetUsersByNameUsecase(searchRepository: mockSearchRepository);
  });

  test('should return projects related to the query params', () async {
    final userLst = [User.initial(), User.initial(), User.initial()];
    const String query = "UserName";

    when(mockSearchRepository.getUsersByName(query))
        .thenAnswer((_) async => Right(userLst));

    final result = await getUsersByNameUsecase(query);

    expect(result, Right(userLst));
    verify(mockSearchRepository.getUsersByName(query)).called(1);
    verifyNoMoreInteractions(mockSearchRepository);
  });

  test('should return Failure when an error occurs', () async {
    const String query = "UserName";
    const failure = Failure(message: "Invalid Request");

    when(mockSearchRepository.getUsersByName(query))
        .thenAnswer((_) async => const Left(failure));

    final result = await getUsersByNameUsecase(query);

    expect(result, const Left(failure));
    verify(mockSearchRepository.getUsersByName(query)).called(1);
    verifyNoMoreInteractions(mockSearchRepository);
  });
}
