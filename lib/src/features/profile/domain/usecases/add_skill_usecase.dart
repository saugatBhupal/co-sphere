import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/profile/domain/entities/skill.dart';
import 'package:cosphere/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class AddSkillUsecase
    implements UsecaseWithParams<List<Skill>, AddSkillsParams> {
  final ProfileRepository profileRepository;

  AddSkillUsecase({required this.profileRepository});
  @override
  Future<Either<Failure, List<Skill>>> call(AddSkillsParams params) {
    return profileRepository.addSkill(params);
  }
}

class AddSkillsParams {
  final String uid;
  final String name;

  AddSkillsParams({required this.uid, required this.name});
}
