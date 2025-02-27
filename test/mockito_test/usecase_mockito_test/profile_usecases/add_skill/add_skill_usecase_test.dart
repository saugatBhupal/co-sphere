import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/profile/domain/entities/skill.dart';
import 'package:cosphere/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:cosphere/src/features/profile/domain/usecases/add_skill_usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:uuid/uuid.dart';

import 'add_skill_usecase_test.mocks.dart';

@GenerateMocks([ProfileRepository])
void main() {
  late MockProfileRepository mockProfileRepository;
  late AddSkillUsecase addSkillUsecase;

  setUp(() {
    mockProfileRepository = MockProfileRepository();
    addSkillUsecase = AddSkillUsecase(profileRepository: mockProfileRepository);
  });

  final reqDto = AddSkillsParams(uid: const Uuid().v4(), name: 'skillName');
  test('should return List of Skills of the user', () async {
    // Arrange
    final skillLst = [Skill.initial(), Skill.initial()];
    when(mockProfileRepository.addSkill(reqDto))
        .thenAnswer((_) async => Right(skillLst));
    // Act
    final result = await addSkillUsecase.call(reqDto);
    // Assert
    expect(result, Right(skillLst));
    verify(mockProfileRepository.addSkill(reqDto)).called(1);
    verifyNoMoreInteractions(mockProfileRepository);
  });

  test('should return Failure when an Education is not added', () async {
    // Arrange
    const failure = Failure(message: "User not found");

    when(mockProfileRepository.addSkill(reqDto))
        .thenAnswer((_) async => const Left(failure));

    // Act
    final result = await addSkillUsecase.call(reqDto);

    // Assert
    expect(result, const Left(failure));
    verify(mockProfileRepository.addSkill(reqDto)).called(1);
    verifyNoMoreInteractions(mockProfileRepository);
  });
}
