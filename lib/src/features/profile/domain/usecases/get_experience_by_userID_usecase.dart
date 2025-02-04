import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/profile/data/dto/get_experience_response_dto/get_experience_response_dto.dart';
import 'package:cosphere/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class GetExperienceByUserIDUsecase
    implements UsecaseWithParams<GetExperienceResponseDto, String> {
  final ProfileRepository profileRepository;

  GetExperienceByUserIDUsecase({required this.profileRepository});
  @override
  Future<Either<Failure, GetExperienceResponseDto>> call(String params) {
    return profileRepository.getExperienceByUserID(params);
  }
}
