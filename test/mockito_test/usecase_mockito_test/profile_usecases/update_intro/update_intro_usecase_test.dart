import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/profile/data/dto/intro/update_intro_req_dto.dart';
import 'package:cosphere/src/features/profile/data/dto/intro/update_intro_res_dto.dart';
import 'package:cosphere/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:cosphere/src/features/profile/domain/usecases/update_intro_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'update_intro_usecase_test.mocks.dart';

@GenerateMocks([ProfileRepository])
void main() {
  late MockProfileRepository mockProfileRepository;
  late UpdateIntroUsecase updateIntroUsecase;

  setUp(() {
    mockProfileRepository = MockProfileRepository();
    updateIntroUsecase =
        UpdateIntroUsecase(profileRepository: mockProfileRepository);
  });

  const dto = UpdateIntroReqDto(
    email: 'test@gmail.com',
    about: 'Hey there',
    overview: 'I am working',
  );

  test('should return reviews details of the id', () async {
    final res = UpdateIntroResDto(about: 'Hey there', overview: 'I am working');

    when(mockProfileRepository.updateIntro(dto))
        .thenAnswer((_) async => Right(res));

    final result = await updateIntroUsecase(dto);

    expect(result, Right(res));
    verify(mockProfileRepository.updateIntro(dto)).called(1);
    verifyNoMoreInteractions(mockProfileRepository);
  });

  test('should return Failure when an error occurs', () async {
    const failure = Failure(message: "User does not exist");

    when(mockProfileRepository.updateIntro(dto))
        .thenAnswer((_) async => const Left(failure));

    final result = await updateIntroUsecase(dto);

    expect(result, const Left(failure));
    verify(mockProfileRepository.updateIntro(dto)).called(1);
    verifyNoMoreInteractions(mockProfileRepository);
  });
}
