import 'package:cosphere/src/core/domain/usecases/base_usecase.dart';
import 'package:cosphere/src/core/error/failure.dart';
import 'package:cosphere/src/features/profile/data/dto/intro/update_intro_req_dto.dart';
import 'package:cosphere/src/features/profile/data/dto/intro/update_intro_res_dto.dart';
import 'package:cosphere/src/features/profile/domain/repositories/profile_repository.dart';
import 'package:dartz/dartz.dart';

class UpdateIntroUsecase
    implements UsecaseWithParams<UpdateIntroResDto, UpdateIntroReqDto> {
  final ProfileRepository profileRepository;

  UpdateIntroUsecase({required this.profileRepository});
  @override
  Future<Either<Failure, UpdateIntroResDto>> call(UpdateIntroReqDto params) {
    return profileRepository.updateIntro(params);
  }
}
