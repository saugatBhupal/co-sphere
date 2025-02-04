import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/profile/data/dto/experience/get_experience_res_dto.dart';
import 'package:cosphere/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class GetExperienceByUserIDUsecase
    implements UsecaseWithParams<GetExperienceResDto, String> {
  final ProfileRepository profileRepository;

  GetExperienceByUserIDUsecase({required this.profileRepository});
  @override
  Future<Either<Failure, GetExperienceResDto>> call(String params) {
    return profileRepository.getExperienceByUserID(params);
  }
}
