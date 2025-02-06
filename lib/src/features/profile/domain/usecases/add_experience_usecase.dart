import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/profile/data/dto/experience/add_experience_req_dto.dart';
import 'package:cosphere/src/features/profile/domain/entities/experience.dart';
import 'package:cosphere/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class AddExperienceUsecase
    implements UsecaseWithParams<Experience, AddExperienceReqDto> {
  final ProfileRepository profileRepository;

  AddExperienceUsecase({required this.profileRepository});
  @override
  Future<Either<Failure, Experience>> call(AddExperienceReqDto params) {
    return profileRepository.addExperience(params);
  }
}
